//
//  TheMovieGesture.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: TheMovieGesture
/// Swipe down to perform action.
///
struct TheMovieGesture: ViewModifier {

  @Environment(\.horizontalSizeClass) private var horizontalSizeClass

  var action: () -> Void

  let swipeValue: CGFloat = 30

  func body(content: Content) -> some View {
    content
      .contentShape(Rectangle())
      .gesture(
        DragGesture(minimumDistance: swipeValue, coordinateSpace: .local)
          .onEnded { value in
            if value.translation.height > .zero
                && value.translation.width < swipeValue
                && value.translation.width > -swipeValue {
              action()
            }
          }
      )
  }
}
