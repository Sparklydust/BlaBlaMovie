//
//  MoviesSearchData.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: MoviesSearchData
/// Data fetch from api when requesting a searchMovies(String)
/// request from NetworkingManager.
///
struct MoviesSearchData: Codable {

  let search: [SearchResultData]
  let totalResults: String
  let response: String

  enum CodingKeys: String, CodingKey {
    case search = "Search"
    case totalResults
    case response = "Response"
  }
}
