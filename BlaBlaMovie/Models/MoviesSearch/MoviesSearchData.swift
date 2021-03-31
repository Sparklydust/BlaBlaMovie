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
final class MoviesSearchData: ObservableObject, Codable {

  @Published var search: [SearchResultData]
  @Published var totalResults: String
  @Published var response: String

  enum CodingKeys: String, CodingKey {
    case search = "Search"
    case totalResults
    case response = "Response"
  }

  init(search: [SearchResultData],
       totalResults: String,
       response: String) {
    self.search = search
    self.totalResults = totalResults
    self.response = response
  }
}
