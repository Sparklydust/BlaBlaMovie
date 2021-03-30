//
//  BaseXCTestCase.swift
//  BlaBlaMovieTests
//
//  Created by Roland Lariotte on 29/03/2021.
//

import Combine
import XCTest
@testable import BlaBlaMovie

//  MARK: BaseXCTestCase
/// Holds all mocks and fakes data needed for the tests.
///
/// By adding the BaseXCTestCase as an extension to tests class,
/// we can avoid duplications and retrieve, in one place, all the
/// mocks and fake data.
///
class BaseXCTestCase: XCTestCase {

  var subscriptions: Set<AnyCancellable>!

  var fakeURL: URL!

  var mockURLSession: MockURLSession!
  var mockNetworkingManager: NetworkingManager!

  override func setUp() {
    super.setUp()
    subscriptions = Set<AnyCancellable>()

    fakeURL = URL(string: "www.test.com")

    mockURLSession = MockURLSession(data: nil, response: nil, error: nil)
    mockNetworkingManager = NetworkingManager(urlSession: mockURLSession)
  }

  override func tearDown() {
    mockNetworkingManager = nil
    mockURLSession = nil

    fakeURL = nil

    subscriptions = []
    super.tearDown()
  }
}
