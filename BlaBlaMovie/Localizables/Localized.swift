//
//  Localized.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Foundation

//  MARK: Localized
/// Enumeration of the keys path to translations in
/// the Localizable.strings files.
///
enum Localized {

  // MARK: - Alert Message
  //
  static let internalServerErrorAlertMessage = NSLocalizedString(
    "internalServerErrorAlertMessage",
    comment: "Alert message populated to the user")

  static let invalidResponseAlertMessage = NSLocalizedString(
    "invalidResponseAlertMessage",
    comment: "Alert message populated to the user")

  static let notFoundAlertMessage = NSLocalizedString(
    "notFoundAlertMessage",
    comment: "Alert message populated to the user")

  static let unauthorizedAlertMessage = NSLocalizedString(
    "unauthorizedAlertMessage",
    comment: "Alert message populated to the user")

  static let UnknownAlertMessage = NSLocalizedString(
    "UnknownAlertMessage",
    comment: "Alert message populated to the user")

  // MARK: - Alert Title
  //
  static let internalServerErrorAlertTitle = NSLocalizedString(
    "internalServerErrorAlertTitle",
    comment: "Alert title populated to the user")


  static let invalidResponseAlertTitle = NSLocalizedString(
    "invalidResponseAlertTitle",
    comment: "Alert title populated to the user")


  static let notFoundAlertTitle = NSLocalizedString(
    "notFoundAlertTitle",
    comment: "Alert title populated to the user")


  static let unauthorizedAlertTitle = NSLocalizedString(
    "unauthorizedAlertTitle",
    comment: "Alert title populated to the user")


  static let UnknownAlertTitle = NSLocalizedString(
    "UnknownAlertTitle",
    comment: "Alert title populated to the user")

  // MARK: - Buttons
  //
  static let skipNextTimeButton = NSLocalizedString(
    "skipNextTimeButton",
    comment: "skip WelcomeView secondary button")

  static let startButton = NSLocalizedString(
    "startButton",
    comment: "button label to start navigating inside the app")

  // MARK: - Labels
  //
  static let chooseMoviesRuleLabel = NSLocalizedString(
    "chooseMoviesRuleLabel",
    comment: "label populated in WelcomeView to tell the user the rules")

  static let giveTheWordLabel = NSLocalizedString(
    "giveTheWordLabel",
    comment: "label populated in WelcomeView to tell the user the rules")

  static let winningInfoLabel = NSLocalizedString(
    "winningInfoLabel",
    comment: "label populated in WelcomeView to tell the user the rules")


  // MARK: - Tab Items
  //
  static let moviesTabItem = NSLocalizedString(
    "moviesTabItem",
    comment: "movies tab item representing")

  // MARK: - Titles
  //
  static let chooseMoviesRuleTitle = NSLocalizedString(
    "chooseMoviesRuleTitle",
    comment: "title populated in WelcomeView to showcase the rules")

  static let giveTheWordTitle = NSLocalizedString(
    "giveTheWordTitle",
    comment: "title populated in WelcomeView to showcase the rules")

  static let welcomeTitle = NSLocalizedString(
    "welcomeTitle",
    comment: "title of the welcome view")

  static let winningInfoTitle = NSLocalizedString(
    "winningInfoTitle",
    comment: "title populated in WelcomeView to showcase the rules")
}
