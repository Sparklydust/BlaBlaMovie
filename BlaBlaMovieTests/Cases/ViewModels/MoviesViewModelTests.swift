//
//  MoviesViewModelTests.swift
//  BlaBlaMovieTests
//
//  Created by Roland Lariotte on 30/03/2021.
//

import XCTest
@testable import BlaBlaMovie

class MoviesViewModelTests: BaseXCTestCase {

  var sut: MoviesViewModel!

  override func setUp() {
    super.setUp()
    sut = MoviesViewModel(networkingManager: mockNetworkingManager)
  }

  override func tearDown() {
    sut = nil 
    super.tearDown()
  }
}

// MARK: - Networking
extension MoviesViewModelTests {
  func testNetworking_searchForPirateMovies_return10PirateMoviesInMoviesDataVariable() {
    let expected = 10
    let expectation = XCTestExpectation()
    sut.networkingManager = NetworkingManager(
      urlSession: MockURLSession(
        data: FakeResponseData.searchMoviesCorrectData,
        response: FakeResponseData.responseCode200,
        error: nil))

    sut.getMovies("pirate") { [weak self] in
      expectation.fulfill()
      let result = self!.sut.moviesData.count

      XCTAssertEqual(result, expected,
                     "10 pirate movies data must be fetched from api call.")
    }
    wait(for: [expectation], timeout: 0.5)
  }
}
