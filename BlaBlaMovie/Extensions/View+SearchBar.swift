//
//  View+SearchBar.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

// MARK: View+SearchBar
extension View {

  /// Add SearchBarItem UIView as a Modifier into a parent
  /// SwiftUI view.
  ///
  func add(_ searchBar: SearchBarItem) -> some View {
    return self.modifier(SearchBarModifier(searchBar: searchBar))
  }
}
