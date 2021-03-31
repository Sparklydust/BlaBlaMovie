//
//  WinnerMovieView.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 31/03/2021.
//

import SwiftUI

//  MARK: WinnerMovieView
/// View that populate the winning movie of the week.
///
struct WinnerMovieView: View {
  var body: some View {
    VStack {
      Image(systemName: "crown.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 120, height: 120)
        .foregroundColor(.yellow)
        .padding()

      Text("The winning movie of the week is")

      Text("Pirates of the Caribbean")
        .font(.title2)
        .fontWeight(.bold)
        .padding()
    }
  }
}

// MARK: - Previews
struct WinnerMovieView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WinnerMovieView()

      WinnerMovieView()
        .preferredColorScheme(.dark)
    }
  }
}
