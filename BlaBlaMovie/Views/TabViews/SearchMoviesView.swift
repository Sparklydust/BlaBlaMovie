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

  @ObservedObject var viewModel = MoviesViewModel()

  @StateObject var searchBarItem = SearchBarItem()

  var body: some View {
    ZStack {
      NavigationView {
        VStack {
          List(viewModel.moviesData, id: \.imdbID) { movie in
            Text(movie.title)
          }
        }
        .add(searchBarItem)
        .navigationTitle(Localized.moviesTabItem)
      }

      if viewModel.isProgressViewOn {
        ProgressView()
          .modifier(MainProgressViewModifier())
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .onAppear { viewModel.getMovies("pirate") }
    .alert(isPresented: $viewModel.showAlert) {
      viewModel.alertManager.populateAlert()
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
