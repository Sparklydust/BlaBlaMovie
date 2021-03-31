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

  @State var isSelected = false

  var body: some View {
    VStack {
      Text(viewModel.movieData?.title ?? String())
        .font(.title)
        .fontWeight(.heavy)
        .padding()

      HStack(alignment: .top) {

        WebImageView(url: URL(string: viewModel.movieData!.poster),
                     image: { Image(uiImage: $0) })
          .frame(width: 88, height: 132)
          .environmentObject(viewModel)

        VStack(spacing: 8) {
          Text("Director: \(viewModel.movieData?.director ?? String())")
            .frame(maxWidth: .infinity, alignment: .leading)

          Text("Actors: \(viewModel.movieData?.actors ?? String())")
            .frame(maxWidth: .infinity, alignment: .leading)

          Text("Year: \(viewModel.movieData?.year ?? String())")
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 4)
      }
      .padding(.bottom)

      VStack(spacing: 4) {
        Text("Synopsis:")
          .frame(maxWidth: .infinity, alignment: .leading)

        Text(viewModel.movieData?.plot ?? String())
          .multilineTextAlignment(.leading)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      Spacer()
    }
    .navigationBarTitle(String(), displayMode: .inline)
    .padding()
    .toolbar {
      ToolbarItem {
        Image(systemName: isSelected ? "star.fill" : "star")
          .resizable()
          .frame(width: 28, height: 28)
          .scaledToFit()
          .foregroundColor(.yellow)
          .onTapGesture { withAnimation(.easeInOut) {
            isSelected.toggle()
          }}
      }
    }
  }
}

// MARK: - Previews
struct MovieDetailsView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      MovieDetailsView()

      MovieDetailsView()
        .preferredColorScheme(.dark)
    }
  }
}
