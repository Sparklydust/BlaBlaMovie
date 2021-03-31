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
final class MovieData: ObservableObject, Codable {

  @Published var title: String
  @Published var year: String
  @Published var rated: String
  @Published var released: String
  @Published var runtime: String
  @Published var genre: String
  @Published var director: String
  @Published var writer: String
  @Published var actors: String
  @Published var plot: String
  @Published var language: String
  @Published var country: String
  @Published var awards: String
  @Published var poster: String
  @Published var ratings: [RatingData]
  @Published var metascore: String
  @Published var imdbRating: String
  @Published var imdbVotes: String
  @Published var imdbID: String
  @Published var type: String
  @Published var response: String

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

  init(title: String,
       year: String,
       rated: String,
       released: String,
       runtime: String,
       genre: String,
       director: String,
       writer: String,
       actors: String,
       plot: String,
       language: String,
       country: String,
       awards: String,
       poster: String,
       ratings: [RatingData],
       metascore: String,
       imdbRating: String,
       imdbVotes: String,
       imdbID: String,
       type: String,
       response: String) {
    self.title = title
    self.year = year
    self.rated = rated
    self.released = released
    self.runtime = runtime
    self.genre = genre
    self.director = director
    self.writer = writer
    self.actors = actors
    self.plot = plot
    self.language = language
    self.country = country
    self.awards = awards
    self.poster = poster
    self.ratings = ratings
    self.metascore = metascore
    self.imdbRating = imdbRating
    self.imdbVotes = imdbVotes
    self.imdbID = imdbID
    self.type = type
    self.response = response
  }
}
