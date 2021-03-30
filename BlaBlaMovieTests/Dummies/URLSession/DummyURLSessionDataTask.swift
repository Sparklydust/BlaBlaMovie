//
//  DummyURLSessionDataTask.swift
//  BlaBlaMovieTests
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: DummyURLSessionDataTask
/// Dummy url session data task to send fake data for unit test.
///
final class DummyURLSessionDataTask: URLSessionDataTask {

  private let closure: () -> Void

  init(closure: @escaping () -> Void) {
    self.closure = closure
  }

  override func resume() {
    closure()
  }
}
