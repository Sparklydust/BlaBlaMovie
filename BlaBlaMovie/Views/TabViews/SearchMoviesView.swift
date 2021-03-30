//
//  SearchMoviesView.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: SearchMoviesView
/// Main view that populate the search field as well
/// as the listing of the result of this search.
///
struct SearchMoviesView: View {

  @StateObject var searchBarItem = SearchBarItem()

  var body: some View {
    NavigationView {
      VStack {
        Text("SearchMoviesView")
      }
      .add(searchBarItem)
      .navigationTitle(Localized.moviesTabItem)
    }
  }
}

// MARK: - Previews
struct SearchMoviesView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      SearchMoviesView()

      SearchMoviesView()
        .preferredColorScheme(.dark)
    }
  }
}
