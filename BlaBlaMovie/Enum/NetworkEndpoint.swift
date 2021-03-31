//
//  NetworkEndpoint.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 29/03/2021.
//

import Foundation

//  MARK: NetworkEndpoint
/// URL path definition that send requests to the BlaBlaMovie server side.
///
/// ```
/// NetworkEndpoint.searchMovies(MOVIE_NAME).url  // example of use
/// ```
///
enum NetworkEndpoint {

  #warning("Change the value of apiKey with your personal one from http://omdbapi.com.")
  static var apiKey = BundleManager.retrieveAPIKey()

  /// Base api url
  ///
  static let baseURL = URL(string: "http://www.omdbapi.com/?apikey=\(apiKey)&")

  // MARK: Resources
  //
  case searchMovies(String)
  case movie(String)

  /// BlaBlaMovie api endpoint.
  ///
  var url: URL {
    switch self {
    case .movie(let imdbID):
      return NetworkEndpoint
        .baseURL
        .flatMap { URL(string: $0.absoluteString + "i=\(imdbID)") }!
    case .searchMovies(let name):
      return NetworkEndpoint
        .baseURL
        .flatMap { URL(string: $0.absoluteString + "s=\(name)") }!
    }
  }
}
