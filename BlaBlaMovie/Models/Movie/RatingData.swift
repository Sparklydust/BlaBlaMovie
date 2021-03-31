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
struct RatingData: Codable {

  let source: String
  let value: String

  enum CodingKeys: String, CodingKey {
    case source = "Source"
    case value = "Value"
  }
}
