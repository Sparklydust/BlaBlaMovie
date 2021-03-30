//
//  BlankMovieCell.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: BlankMovieCell
/// Empty cell being shown when matchedGeometryEffect is triggered to
/// avoid glitch.
///
/// - Warning: Frame must match the original MovieCell.
///
struct BlankMovieCell: View {

  var body: some View {
    Color.clear
      .frame(height: 36)
  }
}
