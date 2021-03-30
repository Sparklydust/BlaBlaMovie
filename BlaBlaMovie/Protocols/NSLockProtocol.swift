//
//  NSLockProtocol.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

protocol NSLockProtocol {

  func lock()
  func unlock()
}

// Adding NSLockProtocol to NSLock for testing purposes.
//
extension NSLock: NSLockProtocol {}
