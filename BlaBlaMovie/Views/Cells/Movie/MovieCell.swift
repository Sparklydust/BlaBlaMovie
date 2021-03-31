//
//  MovieCell.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: MovieCell
/// Populate the movies fetch from the user api search.
///
struct MovieCell: View {

  @EnvironmentObject var viewModel: MoviesViewModel

  @State var isSelected = false
  @State var showMovieDetails = false

  var movie: SearchResultData
  var namespace: Namespace.ID

  var body: some View {
    HStack(spacing: 16) {
      NavigationLink(destination: MovieDetailsView()
                      .environmentObject(viewModel),
                     isActive: $showMovieDetails) {

        Button(action: {
          viewModel.getMovie(movie.imdbID,
                             successHandler: { showMovieDetails = true })
        }) {
          HStack(spacing: 16) {
            WebImageView(url: URL(string: movie.poster),
                         image: { Image(uiImage: $0) })
              .onTapGesture(count: 7) { viewModel.selectedMovie = movie }
              .matchedGeometryEffect(id: "\(movie.imdbID)image", in: namespace)
              .frame(width: 44, height: 66)
              .environmentObject(viewModel)

            VStack(spacing: 4) {
              Text(movie.title)
                .foregroundColor(.black)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)

              Text(movie.year)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

              Spacer()
            }
            .lineLimit(1)
          }
        }}
      Spacer()

      Image(systemName: isSelected ? "star.fill" : "star")
        .resizable()
        .frame(width: 28, height: 28)
        .scaledToFit()
        .foregroundColor(.yellow)
        .onTapGesture { withAnimation(.easeInOut) {
          viewModel.selectFavoriteMovie(id: movie.imdbID) {
            isSelected.toggle()
          }
        }}

      Image(systemName: "chevron.right")
        .foregroundColor(.secondary)
    }
    .padding(.vertical, 8)
    .zIndex(.zero)
    .onAppear {
      if viewModel.favoritedMoviesID.contains(movie.imdbID) {
        isSelected = true
      }
      else {
        isSelected = false
      }
    }
  }
}

// MARK: - Previews
struct MovieCell_Preview: PreviewProvider {

  struct MovieCellFake: View {

    @Namespace var namespace

    var body: some View {
      MovieCell(
        movie: SearchResultData(
          title: "Godzilla",
          year: "2018",
          imdbID: "1234",
          type: .movie,
          poster: "http://fake.com"),
        namespace: namespace)
    }
  }
  
  static var previews: some View {
    Group {
      MovieCellFake()

      MovieCellFake()
        .preferredColorScheme(.dark)
    }
  }
}
