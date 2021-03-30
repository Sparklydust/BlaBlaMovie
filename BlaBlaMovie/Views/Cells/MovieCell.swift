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

  var movie: SearchResultData

  var body: some View {
    HStack(spacing: 16) {
      WebImageView(url: URL(string: movie.poster),
                   image: { Image(uiImage: $0) })

      VStack(alignment: .leading, spacing: 4) {
        Text(movie.title)
          .fontWeight(.medium)
        
        Text(movie.year)

        Spacer()
      }
      .lineLimit(1)

      Spacer()

      Image(systemName: isSelected ? "star.fill" : "star")
        .resizable()
        .frame(width: 28, height: 28)
        .scaledToFit()
        .foregroundColor(.yellow)
        .padding(.trailing, 8)
        .onTapGesture { withAnimation(.easeInOut) {
          isSelected.toggle()
        }}
    }
    .padding(.vertical, 8)
  }
}

// MARK: - Previews
struct MovieCell_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      MovieCell(movie: SearchResultData(
                  title: "Godzilla",
                  year: "2021",
                  imdbID: "1234",
                  type: .movie,
                  poster: "http://fake.com"))

      MovieCell(movie: SearchResultData(
                  title: "Godzilla",
                  year: "2021",
                  imdbID: "1234",
                  type: .movie,
                  poster: "http://fake.com"))
        .preferredColorScheme(.dark)
    }
  }
}
