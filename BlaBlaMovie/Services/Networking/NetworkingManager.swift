//
//  NetworkingManager.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Combine
import SwiftUI

//  MARK: NetworkingManager
/// Handle network request to the BlaBlaMovie api.
///
final class NetworkingManager {

  let imageSerialQueue = DispatchQueue(label: "imageSerialQueue")

  // Used to inject mock during tests.
  let imageCacheManager: ImageCacheProtocol
  var urlSession: URLSession

  init(imageCacheManager: ImageCacheProtocol = ImageCacheManager(),
       urlSession: URLSession = URLSession.shared) {
    self.imageCacheManager = imageCacheManager
    self.urlSession = urlSession
  }
}

// MARK: - Get
extension NetworkingManager {
  /// Get request that fetch any type of data defined in the parameter data.
  ///
  /// - Parameters:
  ///   - data: Any type of data needed from the api that is codable.
  ///   - networkEndpoint: The url endpoint to fetch the defined T.Type.
  /// - Returns: The corresponding data type fetched from the api endpoint
  /// or an error if any.
  ///
  func get<T: Codable>(_ data: T.Type,
                       atURL networkEndpoint: NetworkEndpoint) -> AnyPublisher<T, Error> {

    urlSession
      .dataTaskPublisher(for: networkEndpoint.url)
      .tryMap { try self.validate($0.data, $0.response) }
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }

  /// Get image associated to a url during a network request.
  ///
  /// The image will be cached during the network request. If
  /// it has already been cached, it will be fetch from memory
  /// without making any network request. There is also a downsample
  /// action to reduce image size and memory footprint.
  ///
  /// - Parameter url: The url endpoint of an image.
  /// - Returns: UIImage as a publisher.
  ///
  func getImage(atURL url: URL) -> AnyPublisher<UIImage?, Never> {
    if let image = imageCacheManager[url] {
      return Just(image).eraseToAnyPublisher()
    }

    return urlSession
      .dataTaskPublisher(for: url)
      .subscribe(on: imageSerialQueue)
      .map { [weak self] in self?.downsample($0.data) }
      .replaceError(
        with: UIImage(systemName: "xmark.octagon")?
          .withTintColor(.secondaryLabel))
      .handleEvents(
        receiveOutput: { [unowned self] image in
          guard let image = image else { return }
          self.imageCacheManager[url] = image })
      .eraseToAnyPublisher()
  }
}

// MARK: - Request Response
extension NetworkingManager {
  /// Validation of the response coming from the api call.
  ///
  /// - Parameters:
  ///   - data: Data coming from the api call if successful.
  ///   - response: HTTP response code to handle api errors.
  /// - Throws: NetworkError from server.
  /// - Returns: Data if success else error.
  ///
  func validate(_ data: Data, _ response: URLResponse) throws -> Data {
    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.invalidResponse
    }
    guard (200..<300).contains(httpResponse.statusCode) else {
      throw networkRequestError(from: httpResponse.statusCode)
    }
    return data
  }

  /// Switch every status code to send the right NetworkError to
  /// the user if network request failed.
  ///
  /// - Parameter statusCode: HTTP response status code.
  /// - Returns: NetworkError associated to the status code.
  ///
  func networkRequestError(from statusCode: Int) -> NetworkError {

    switch statusCode {
    case 401:
      return NetworkError.unauthorized
    case 404:
      return NetworkError.notFound
    case 500:
      return NetworkError.internalServerError
    default:
      return NetworkError.unknown
    }
  }
}

// MARK: - Helpers
extension NetworkingManager {
  /// Downsampling large image for displaying it at a smaller size
  /// to reduce memory usage.
  ///
  /// - Warning: An error can be thrown when downsampling imageSource.
  /// Make sure to handle this error on the network request.
  /// - Parameter data: Image as data from api call.
  /// - Returns: UIImage downsampled or an error if any.
  ///
  func downsample(_ imageData: Data) -> UIImage? {
    let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
    let imageSource = CGImageSourceCreateWithData(imageData as CFData,
                                                  imageSourceOptions)

    let downsampleOptions = [
      kCGImageSourceCreateThumbnailFromImageAlways: true,
      kCGImageSourceShouldCacheImmediately: true,
      kCGImageSourceCreateThumbnailWithTransform: true,
      kCGImageSourceThumbnailMaxPixelSize: max(60, 60) * 2
    ] as CFDictionary

    let downsampledImage = CGImageSourceCreateImageAtIndex(imageSource!, .zero,
                                                           downsampleOptions)
    return UIImage(cgImage: downsampledImage!)
  }
}
