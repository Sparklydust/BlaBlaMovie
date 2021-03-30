//
//  AlertProtocol.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

protocol AlertProtocol {

  var blaBlaMovieAlert: BlaBlaMovieAlert { get set }

  func trigger(_ alert: BlaBlaMovieAlert, _ show: inout Bool)
  func populateAlert() -> Alert
  func populateAlert(title: String, message: String) -> Alert
}
