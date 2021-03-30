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

  @Namespace var namespace

  @ObservedObject var viewModel = MoviesViewModel()

  @StateObject var searchBarItem = SearchBarItem()

  var body: some View {
    ZStack {
      NavigationView {
        ScrollView {
          VStack {
            ForEach(viewModel.moviesData, id: \.imdbID) { movie in
              if movie.imdbID != viewModel.selectedMovie?.imdbID {
                MovieCell(movie: movie,
                          namespace: namespace)
                  .environmentObject(viewModel)
                  .animation(.easeInOut(duration: 0.35))
                  .zIndex(1)
              }
              else {
                BlankMovieCell()
              }
            }
          }
        }
        .padding(.horizontal)
        .add(searchBarItem)
        .navigationTitle(Localized.moviesTabItem)
      }

      if viewModel.isProgressViewOn {
        ProgressView()
          .modifier(MainProgressViewModifier())
      }

      if let movieInfo = viewModel.selectedMovie {
        TheMovieView(movie: $viewModel.selectedMovie,
                     movieInfo: movieInfo,
                     namespace: namespace)
      }
    }
    .zIndex(-1)
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
