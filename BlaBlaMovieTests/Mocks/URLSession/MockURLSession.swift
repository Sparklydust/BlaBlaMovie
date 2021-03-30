//
//  MockURLSession.swift
//  BlaBlaMovieTests
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: MockURLSession
/// Mock URLSession to send fake data for unit test.
///
final class MockURLSession: URLSession {

  var data: Data?
  var response: URLResponse?
  var error: Error?

  init(data: Data?, response: URLResponse?, error: Error?) {
    self.data = data
    self.response = response
    self.error = error
  }
}

// MARK: DataTask
extension MockURLSession {
  override func dataTask(
    with request: URLRequest,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

    let data = self.data
    let response = self.response
    let error = self.error

    return DummyURLSessionDataTask {
      completionHandler(data, response, error)
    }
  }
}
