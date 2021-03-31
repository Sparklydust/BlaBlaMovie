//
//  RatingData.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 31/03/2021.
//

import Foundation

//  MARK: RatingData
/// Rating values of a movie.
///
final class RatingData: ObservableObject, Codable {

  @Published var source: String
  @Published var value: String

  enum CodingKeys: String, CodingKey {
    case source = "Source"
    case value = "Value"
  }

  init(source: String,
       value: String) {
    self.source = source
    self.value = value
  }
}
