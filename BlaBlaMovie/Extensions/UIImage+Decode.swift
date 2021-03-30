//
//  UIImage+Decode.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import UIKit

//  MARK: UIImage+Decode
extension UIImage {

  /// Size of the image on disk.
  ///
  var diskSize: Int {
    guard let cgImage = cgImage else { return .zero }
    return cgImage.bytesPerRow * cgImage.height
  }

  /// Decode cached image.
  ///
  /// - Returns: UIImage that was cached.
  ///
  func decodedImage() -> UIImage {
    guard let cgImage = cgImage else { return self }

    let size = CGSize(width: cgImage.width,
                      height: cgImage.height)

    let colorSpace = CGColorSpaceCreateDeviceRGB()

    let context = CGContext(
      data: nil, width: Int(size.width),
      height: Int(size.height),
      bitsPerComponent: 8,
      bytesPerRow: cgImage.bytesPerRow,
      space: colorSpace,
      bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

    context?.draw(cgImage, in: CGRect(origin: .zero,
                                      size: size))

    guard let decodedImage = context?.makeImage() else { return self }

    return UIImage(cgImage: decodedImage)
  }
}
