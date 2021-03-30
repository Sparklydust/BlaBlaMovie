//
//  MotionPictureType.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: MotionPictureType
/// Enumeration of the motion picture type of data
/// that can be fetched from the api.
///
enum MotionPictureType: String, Codable {

  case movie
  case series
}
