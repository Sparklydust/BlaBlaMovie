//
//  MainProgressViewModifier.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: MainProgressViewModifier
/// Modifier for the ActivityController as ProgressView.
///
struct MainProgressViewModifier: ViewModifier {

  func body(content: Content) -> some View {
    content
      .scaleEffect(1.5)
      .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
  }
}
