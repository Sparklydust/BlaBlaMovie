//
//  SkipButton.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: SkipButton
/// Button to skip welcome view at startup.
///
struct SkipButton: View {

  var action: () -> Void

  var body: some View {
    Button(action: { action() }) {
      Text(Localized.skipNextTimeButton)
        .foregroundColor(.secondary)
    }
    .padding()
  }
}

// MARK: - Previews
struct SkipButton_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SkipButton(action: { })

      SkipButton(action: { })
        .preferredColorScheme(.dark)
    }
  }
}
