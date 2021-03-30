//
//  NetworkEndpointTests.swift
//  BlaBlaMovieTests
//
//  Created by Roland Lariotte on 29/03/2021.
//

import XCTest
@testable import BlaBlaMovie

class NetworkEndpointTests: XCTestCase {

  func testBaseURL_accessingBlaBlaMovieAPI_returnsOmdbapiAPI() {
    let expected = URL(string: "http://www.omdbapi.com/?apikey=\(NetworkEndpoint.apiKey)&")!

    let result = NetworkEndpoint.baseURL

    XCTAssertEqual(result, expected,
                   "Base url must be set to: http://www.omdbapi.com/?apikey=\(NetworkEndpoint.apiKey)&")
  }
}
