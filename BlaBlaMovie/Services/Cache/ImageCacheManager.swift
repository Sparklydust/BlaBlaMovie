//
//  ImageCacheManager.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: ImageCacheManager
/// Manages with CRUD operation caching image to
/// reduce memory footprint.
///
final class ImageCacheManager: ImageCacheProtocol {

  private(set) lazy var encodedImageCache: NSCache<AnyObject, AnyObject> = {
    let cache = NSCache<AnyObject, AnyObject>()
    cache.countLimit = configuration.countLimit
    return cache
  }()

  private(set) lazy var decodedImageCache: NSCache<AnyObject, AnyObject> = {
    let cache = NSCache<AnyObject, AnyObject>()
    cache.totalCostLimit = configuration.memoryLimit
    return cache
  }()

  // MARK: Configurations
  //
  var configuration: CacheConfiguration

  //  MARK: Services
  /// Provide exclusive access and make the cache thread-safe.
  ///
  var lockManager: NSLockProtocol

  init(configuration: CacheConfiguration = CacheConfiguration(),
       lockManager: NSLockProtocol = NSLock()) {
    self.configuration = configuration
    self.lockManager = lockManager
  }
}

// MARK: Subscript
extension ImageCacheManager {
  /// Accesses the value associated with the given url key.
  ///
  /// Reads and writes image cached with the associated url.
  ///
  subscript(_ key: URL) -> UIImage? {
    get {
      return cachedImage(for: key)
    }
    set {
      return insertImage(newValue, for: key)
    }
  }
}

// MARK: Actions
extension ImageCacheManager {
  /// Inserts the image of the specified url in the cache.
  ///
  /// - Parameters:
  ///   - image: Image to cache.
  ///   - url: URL associated to the UIImage.
  ///
  func insertImage(_ image: UIImage?, for url: URL) {
    guard let image = image else { return removeImage(for: url) }
    let decodedImage = image.decodedImage()

    lockManager.lock()
    defer { lockManager.unlock() }

    encodedImageCache.setObject(decodedImage, forKey: url as AnyObject)
    decodedImageCache.setObject(image as AnyObject,
                                forKey: url as AnyObject,
                                cost: decodedImage.diskSize)
  }

  /// Returns the image associated with a given url.
  ///
  /// - Parameter url: URL associated with the UIImage.
  /// - Returns: The cached UIImage if any.
  ///
  func cachedImage(for url: URL) -> UIImage? {
    lockManager.lock()
    defer { lockManager.unlock() }

    if let decodedImage = decodedImageCache.object(forKey: url as AnyObject) as? UIImage {
      return decodedImage
    }

    if let image = encodedImageCache.object(forKey: url as AnyObject) as? UIImage {
      let decodedImage = image.decodedImage()
      decodedImageCache.setObject(image as AnyObject,
                                  forKey: url as AnyObject,
                                  cost: decodedImage.diskSize)
      return decodedImage
    }
    return nil
  }

  /// Removes the image of the specified url in the cache.
  ///
  /// - Parameter url: URL associated with the UIImage.
  ///
  func removeImage(for url: URL) {
    lockManager.lock()
    defer { lockManager.unlock() }

    encodedImageCache.removeObject(forKey: url as AnyObject)
    decodedImageCache.removeObject(forKey: url as AnyObject)
  }

  /// Removes all images from the cache.
  ///
  public func removeAllImages() {
    lockManager.lock()
    defer { lockManager.unlock() }

    encodedImageCache.removeAllObjects()
    decodedImageCache.removeAllObjects()
  }
}
