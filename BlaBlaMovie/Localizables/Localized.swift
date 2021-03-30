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
