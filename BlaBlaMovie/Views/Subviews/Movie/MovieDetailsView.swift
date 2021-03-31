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

  @EnvironmentObject var viewModel: MoviesViewModel

  var body: some View {
    Text(viewModel.movieData?.title ?? String())
  }
}
