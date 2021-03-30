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

  @State var isSelected = false

  var movie: SearchResultModel

  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: "photo")
        .resizable()
        .scaledToFill()
        .frame(width: 44, height: 66)
        .cornerRadius(8)

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
      MovieCell(movie: SearchResultModel(
                  title: "Godzilla",
                  year: "2021",
                  imdbID: "1234",
                  type: .movie,
                  poster: "http://fake.com"))

      MovieCell(movie: SearchResultModel(
                  title: "Godzilla",
                  year: "2021",
                  imdbID: "1234",
                  type: .movie,
                  poster: "http://fake.com"))
        .preferredColorScheme(.dark)
    }
  }
}
