//
//  WelcomeCell.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: WelcomeCell
/// Cell view populated in WelcomeView to showcase what is
/// going on in the application.
///
struct WelcomeCell: View {

  var image: Image
  var color: Color
  var title: String
  var message: String

  var body: some View {
    HStack(alignment: .center, spacing: 24) {
      image
        .resizable()
        .scaledToFit()
        .frame(width: 50, height: 50)
        .foregroundColor(color)

      VStack(alignment: .leading) {
        Text(title)
          .font(.headline)

        Text(message)
      }
      .multilineTextAlignment(.leading)
      .minimumScaleFactor(0.8)
    }
  }
}

// MARK: - Previews
struct WelcomeCell_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WelcomeCell(image: .movieTicket,
                  color: .red,
                  title: "Find a movie",
                  message: "The best movie in the world.")

      WelcomeCell(image: .star,
                  color: .yellow,
                  title: "Favourite the best",
                  message: "Only you can decide what it is.")
        .preferredColorScheme(.dark)
    }
  }
}
