//
//  NetworkingManager.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Combine
import SwiftUI

//  MARK: NetworkingManager
/// Handle network request to the BlaBlaMovie api.
///
final class NetworkingManager {

  // Used to inject mock during tests.
  var urlSession: URLSession

  init(urlSession: URLSession = URLSession.shared) {
    self.urlSession = urlSession
  }
}

// MARK: - Get
extension NetworkingManager {
  /// Get request that fetch any type of data defined in the parameter data.
  ///
  /// - Parameters:
  ///   - data: Any type of data needed from the api that is codable.
  ///   - networkEndpoint: The url endpoint to fetch the defined T.Type.
  /// - Returns: The corresponding data type fetched from the api endpoint
  /// or an error if any.
  ///
  func get<T: Codable>(_ data: T.Type,
                       atURL networkEndpoint: NetworkEndpoint) -> AnyPublisher<T, Error> {

    urlSession
      .dataTaskPublisher(for: networkEndpoint.url)
      .tryMap { try self.validate($0.data, $0.response) }
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}

// MARK: - Request Response
extension NetworkingManager {
  /// Validation of the response coming from the api call.
  ///
  /// - Parameters:
  ///   - data: Data coming from the api call if successful.
  ///   - response: HTTP response code to handle api errors.
  /// - Throws: NetworkError from server.
  /// - Returns: Data if success else error.
  ///
  func validate(_ data: Data, _ response: URLResponse) throws -> Data {
    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.invalidResponse
    }
    guard (200..<300).contains(httpResponse.statusCode) else {
      throw networkRequestError(from: httpResponse.statusCode)
    }
    return data
  }

  /// Switch every status code to send the right NetworkError to
  /// the user if network request failed.
  ///
  /// - Parameter statusCode: HTTP response status code.
  /// - Returns: NetworkError associated to the status code.
  ///
  func networkRequestError(from statusCode: Int) -> NetworkError {

    switch statusCode {
    case 401:
      return NetworkError.unauthorized
    case 404:
      return NetworkError.notFound
    case 500:
      return NetworkError.internalServerError
    default:
      return NetworkError.unknown
    }
  }
}
