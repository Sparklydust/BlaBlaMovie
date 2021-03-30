//
//  ImageCacheProtocol.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

protocol ImageCacheProtocol: class {

  subscript(_ url: URL) -> UIImage? { get set }

  func cachedImage(for url: URL) -> UIImage?
  func insertImage(_ image: UIImage?, for url: URL)
  func removeImage(for url: URL)
  func removeAllImages()
}
