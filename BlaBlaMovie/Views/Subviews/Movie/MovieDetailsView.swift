//
//  MovieDetailsView.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 31/03/2021.
//

import SwiftUI

//  MARK: MovieDetailsView
/// Showing the details of a movie to user.
///
struct MovieDetailsView: View {

  var body: some View {
    Text("MovieDetailsView")
  }
}

// MARK: - Preview
struct MovieDetailsView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      MovieDetailsView()

      MovieDetailsView()
        .preferredColorScheme(.dark)
    }
  }
}
