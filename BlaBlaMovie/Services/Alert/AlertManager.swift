//
//  AlertManager.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: AlertManager
/// Manages the SwiftUI alert that can be triggered on any Views.
///
final class AlertManager: AlertProtocol {
  var blaBlaMovieAlert: BlaBlaMovieAlert = .unknown
}

extension AlertManager {
  /// Trigger Apple Alert for views.
  ///
  /// - Parameter alert: Alert that can be triggered
  /// from view model.
  ///
  func trigger(_ alert: BlaBlaMovieAlert, _ show: inout Bool) {
    blaBlaMovieAlert = alert
    show = true
  }

  /// Populate flow alert on top of the Views from view model
  /// when user perform certain actions.
  ///
  /// - Returns: BlaBlaMovieAlert view that user triggers.
  ///
  func populateAlert() -> Alert {
    switch blaBlaMovieAlert {
    case .internalServerError:
      return populateAlert(
        title: Localized.internalServerErrorAlertTitle,
        message: Localized.internalServerErrorAlertMessage)
    case .invalidResponse:
      return populateAlert(
        title: Localized.invalidResponseAlertTitle,
        message: Localized.invalidResponseAlertMessage)
    case .notFound:
      return populateAlert(
        title: Localized.notFoundAlertTitle,
        message: Localized.notFoundAlertMessage)
    case .unauthorized:
      return populateAlert(
        title: Localized.unauthorizedAlertTitle,
        message: Localized.unauthorizedAlertMessage)
    case .unknown:
      return populateAlert(
        title: Localized.UnknownAlertTitle,
        message: Localized.UnknownAlertMessage)
    }
  }

  /// Simple Apple Alert with one OK button to dismiss it.
  ///
  /// - Parameters:
  ///   - title: Title needed for the alert to show to the user.
  ///   - message: Message needed for the alert to show to the user.
  /// - Returns: SwiftUI Alert with a title and a message.
  ///
  func populateAlert(title: String, message: String) -> Alert {
    Alert(title: Text(title),
          message: Text(message),
          dismissButton: .none)
  }
}
