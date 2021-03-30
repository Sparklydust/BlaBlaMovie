//
//  WelcomeView.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: WelcomeView
/// Populates a welcome message with the rules to the
/// user the first time they connect.
///
struct WelcomeView: View {

  @AppStorage("showWelcomeView")
  var showWelcomeViewStorage = true

  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    ZStack(alignment: .topTrailing) {

      SkipButton(action: {
        showWelcomeViewStorage = false
        presentationMode.wrappedValue.dismiss()
      })

      VStack {
        WelcomeTitle()

        Spacer()

        VStack(alignment: .leading, spacing: 32) {
          WelcomeCell(image: .worldNetwork,
                      color: .blue,
                      title: Localized.giveTheWordTitle,
                      message: Localized.giveTheWordLabel)

          WelcomeCell(image: .movieTicket,
                      color: .red,
                      title: Localized.chooseMoviesRuleTitle,
                      message: Localized.chooseMoviesRuleLabel)

          WelcomeCell(image: .star,
                      color: .yellow,
                      title: Localized.winningInfoTitle,
                      message: Localized.winningInfoLabel)
        }
        Spacer()
        Spacer()
        Spacer()

        MainButton(
          action: { presentationMode.wrappedValue.dismiss() },
          text: Localized.startButton)
      }
      .padding(.horizontal, 40)
      .padding(.vertical)
      .padding(.top)
    }
  }
}

// MARK: - Previews
struct WelcomeView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      WelcomeView()

      WelcomeView()
        .preferredColorScheme(.dark)
    }
  }
}
