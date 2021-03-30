//
//  FakeResponseData.swift
//  BlaBlaMovieTests
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI
@testable import BlaBlaMovie

//  MARK: FakeResponseData
/// Setup fake response for MockURLSession.
///
final class FakeResponseData: Decodable {}

// MARK: - Fakes Json
extension FakeResponseData {

  static var searchMoviesCorrectData: Data {
    let bundle = Bundle(for: FakeResponseData.self)
    let url = bundle.url(forResource: "SearchMoviesData", withExtension: "json")
    let data = try! Data(contentsOf: url!)
    return data
  }
}

// MARK: - Error
extension FakeResponseData {
  class ResourceError: Error {}
  static let error = ResourceError()

  static let BlaBlaMovieIncorrectData = "error".data(using: .utf8)!
}

// MARK: - Status Codes
extension FakeResponseData {
  static let responseCode200 = HTTPURLResponse(url: URL(string: "https://test.com")!,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil)!

  static let responseCode401 = HTTPURLResponse(url: URL(string: "https://test.com")!,
                                               statusCode: 401,
                                               httpVersion: nil,
                                               headerFields: nil)!

  static let responseCode404 = HTTPURLResponse(url: URL(string: "https://test.com")!,
                                               statusCode: 404,
                                               httpVersion: nil,
                                               headerFields: nil)!

  static let responseCode500 = HTTPURLResponse(url: URL(string: "https://test.com")!,
                                               statusCode: 500,
                                               httpVersion: nil,
                                               headerFields: nil)!
}
