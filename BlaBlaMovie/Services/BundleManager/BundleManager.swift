//
//  BundleManager.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 29/03/2021.
//

import Foundation

//  MARK: BundleManager
/// Execute action to get data from the app bundle.
///
final class BundleManager {

  /// Fetch api key from the Configurations/Keys.plist file.
  ///
  /// This file is under .gitignore control. Add your personal key
  /// in NetworkEndpoint.swift to be able to use this application.
  /// - Returns: API key in Keys.plist to access omdbapi.com.
  ///
  class func retrieveAPIKey() -> String {

    guard let filePath = Bundle.main.path(forResource: "Keys", ofType: "plist"),
          let plist = NSDictionary(contentsOfFile: filePath),
          let value = plist.object(forKey: "api") as? String else { return String() }

    return value
  }
}
