//
//  SearchBarRepresentable.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: SearchBarRepresentable
/// UIKit search bar item to be implemented in SwiftUI views.
///
final class SearchBarRepresentable: UIViewControllerRepresentable {

  let onResolve: (UIViewController) -> Void

  init(onResolve: @escaping (UIViewController) -> Void) {
    self.onResolve = onResolve
  }

  func makeUIViewController(context: Context) -> SearchBarViewController {
    SearchBarViewController(onResolve: onResolve)
  }

  func updateUIViewController(_ uiViewController: SearchBarViewController,
                              context: Context) {
    // Intentionally empty
  }
}

class SearchBarViewController: UIViewController {

  let onResolve: (UIViewController) -> Void

  init(onResolve: @escaping (UIViewController) -> Void) {
    self.onResolve = onResolve
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("Use init(onResolve:) to instantiate SearchBarViewController.")
  }

  override func didMove(toParent parent: UIViewController?) {
    super.didMove(toParent: parent)

    if let parent = parent {
      onResolve(parent)
    }
  }
}
