//
//  NetworkError.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: NetworkError
/// Server error definition coming from network calls.
///
enum NetworkError: Error, Equatable {

  case internalServerError
  case invalidResponse
  case notFound
  case unauthorized
  case unknown
}
