//
//  MainButton.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: MainButton
/// Button that represent the main action set with
/// the app accent color.
///
struct MainButton: View {

  var action: () -> Void
  var text: String

  var body: some View {
    Button(action: { action() }) {
      Text(text)
        .font(.headline)
        .lineLimit(1)
        .minimumScaleFactor(0.8)
        .padding(.horizontal)
        .frame(maxWidth: .infinity,
               minHeight: 44,
               alignment: .center)
    }
    .foregroundColor(.white)
    .background(Color.accentColor)
    .clipShape(RoundedRectangle(cornerRadius: 6,
                                style: .continuous))
  }
}

// MARK: - Previews
struct MainButton_Previews: PreviewProvider {

  static var previews: some View {
    Group {
    MainButton(action: { },
               text: "Sign in with email")


      MainButton(action: { },
                 text: "Sign in with email")
        .preferredColorScheme(.dark)
    }
  }
}
