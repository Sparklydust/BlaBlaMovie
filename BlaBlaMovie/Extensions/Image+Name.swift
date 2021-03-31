//
//  Image+Name.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: Image+Name
/// Extension to retrieve all images by name.
///
/// Images are systemName images from the SFSymbol mac app,
/// or can be custom one set in Images.xcassets.
///
extension Image {

  static let movieTicket = Image(systemName: "film")

  static let star = Image(systemName: "star")

  static let crown = Image(systemName: "crown")

  static let worldNetwork = Image(systemName: "network")
}
