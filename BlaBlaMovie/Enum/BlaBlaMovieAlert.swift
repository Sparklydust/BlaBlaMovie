//
//  BlaBlaMovieAlert.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: BlaBlaMovieAlert
/// Alert definition to populate to user from ViewModels.
///
enum BlaBlaMovieAlert {

  case unauthorized
  case internalServerError
  case invalidResponse
  case maxFavoritesReached
  case notFound
  case unknown
}
