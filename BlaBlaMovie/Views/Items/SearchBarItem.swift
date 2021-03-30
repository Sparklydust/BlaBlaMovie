//
//  SearchBarItem.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: SearchBarItem
/// Search bar made from UIKit off to UIViewRepresentable and
/// set to be used on SwiftUI views with SearchBarModifier.
///
class SearchBarItem: NSObject, ObservableObject {

  @Published var text = String()

  let searchController = UISearchController(searchResultsController: nil)

  override init() {
    super.init()
    self.searchController.obscuresBackgroundDuringPresentation = false
    self.searchController.searchResultsUpdater = self
  }
}

extension SearchBarItem: UISearchResultsUpdating {

  func updateSearchResults(for searchController: UISearchController) {

    // Publish search bar text changes.
    if let searchBarText = searchController.searchBar.text {
      self.text = searchBarText
    }
  }
}
