//
//  CacheConfiguration.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: CacheConfiguration
/// Configuration regarding the device memory usage limits
/// when using Cache.
///
struct CacheConfiguration {

  let countLimit: Int
  let memoryLimit: Int

  init(countLimit: Int = 1000,
       memoryLimit: Int = 1024 * 1024 * 1000) {
    self.countLimit = countLimit
    self.memoryLimit = memoryLimit // memoryLimit = 100MB
  }
}
