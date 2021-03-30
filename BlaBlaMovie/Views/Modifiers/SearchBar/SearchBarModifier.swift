//
//  SearchBarModifier.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: SearchBarModifier
/// Create the SearchBarRepresentable as a View Modifier to
/// be able to be implemented where needed in Views.
///
struct SearchBarModifier: ViewModifier {

  let searchBar: SearchBarItem

  func body(content: Content) -> some View {
    content
      .overlay(
        SearchBarRepresentable { viewController in
          viewController.navigationItem.searchController = self.searchBar.searchController
        }
        .frame(width: 0, height: 0)
      )
  }
}
