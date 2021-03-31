//
//  MovieData.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 31/03/2021.
//

import Foundation

//  MARK: MovieData
/// Data representing a movie fetch from the api
/// with a movie imdbID.
///
struct MovieData: Codable {

  let title: String
  let year: String
  let rated: String
  let released: String
  let runtime: String
  let genre: String
  let director: String
  let writer: String
  let actors: String
  let plot: String
  let language: String
  let country: String
  let awards: String
  let poster: String
  let ratings: [RatingData]
  let metascore: String
  let imdbRating: String
  let imdbVotes: String
  let imdbID: String
  let type: String
  let response: String

  enum CodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case rated = "Rated"
    case released = "Released"
    case runtime = "Runtime"
    case genre = "Genre"
    case director = "Director"
    case writer = "Writer"
    case actors = "Actors"
    case plot = "Plot"
    case language = "Language"
    case country = "Country"
    case awards = "Awards"
    case poster = "Poster"
    case ratings = "Ratings"
    case metascore = "Metascore"
    case imdbRating
    case imdbVotes
    case imdbID
    case type = "Type"
    case response = "Response"
  }
}
