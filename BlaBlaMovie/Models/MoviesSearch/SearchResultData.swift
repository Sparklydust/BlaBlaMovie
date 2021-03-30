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
class SearchResultData: ObservableObject, Codable {

  @Published var title: String
  @Published var year: String
  @Published var imdbID: String
  @Published var type: MotionPictureType
  @Published var poster: String

  enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbID
    case type = "Type"
    case poster = "Poster"
  }

  init(title: String,
       year: String,
       imdbID: String,
       type: MotionPictureType,
       poster: String) {
    self.title = title
    self.year = year
    self.imdbID = imdbID
    self.type = type
    self.poster = poster
  }
}
