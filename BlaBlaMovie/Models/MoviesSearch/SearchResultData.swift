//
//  SearchResultData.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: SearchResultData
/// Deep data from the search NetworkingManager request
/// with MoviesSearchData as the main actor.
///
struct SearchResultData: Codable {

  let title: String
  let year: String
  let imdbID: String
  let type: MotionPictureType
  let poster: String

  enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbID
    case type = "Type"
    case poster = "Poster"
  }
}
