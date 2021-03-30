//
//  WelcomeTitle.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

// MARK: WelcomeTitle
/// WelcomeView title.
///
struct WelcomeTitle: View {

  var body: some View {
    Text(Localized.welcomeTitle)
      .font(.largeTitle)
      .fontWeight(.bold)
      .multilineTextAlignment(.center)
      .padding()
      .padding(.top)
  }
}

// MARK: - Previews
struct WelcomeTitle_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WelcomeTitle()

      WelcomeTitle()
        .preferredColorScheme(.dark)
    }
  }
}
