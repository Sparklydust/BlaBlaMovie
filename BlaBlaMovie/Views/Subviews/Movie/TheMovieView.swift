//
//  TheMovieView.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: TheMovieView
/// Most wanted and expected.
///
struct TheMovieView: View {

  @Binding var movie: SearchResultData!

  var movieInfo: SearchResultData
  var namespace: Namespace.ID

  var body: some View {
    Image("wwdc")
      .resizable()
      .scaledToFill()
      .ignoresSafeArea()
      .matchedGeometryEffect(id: "\(movieInfo.imdbID)image", in: namespace)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .modifier(TheMovieGesture(action: { movie = nil }))
  }
}
