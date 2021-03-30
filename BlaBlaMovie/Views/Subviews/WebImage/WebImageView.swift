//
//  WebImageView.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: WebImageView
/// Populate image from web using their url endpoint.
///
struct WebImageView: View {

  @StateObject var viewModel: WebImageViewModel

  private let image: (UIImage) -> Image

  init(url: URL?,
       @ViewBuilder image: @escaping (UIImage) -> Image) {
    self.image = image
    _viewModel = StateObject(wrappedValue: WebImageViewModel(url: url))
  }

  var body: some View {
    ZStack {
      if viewModel.image != nil {
        image(viewModel.image!)
          .resizable()
          .scaledToFit()
          .frame(width: 44, height: 66)
          .cornerRadius(8)
      }
      else {
        Image(systemName: "photo")
          .resizable()
          .scaledToFill()
          .frame(width: 44, height: 66)
          .cornerRadius(8)
      }
    }
    .onAppear { viewModel.getImage() }
  }
}
