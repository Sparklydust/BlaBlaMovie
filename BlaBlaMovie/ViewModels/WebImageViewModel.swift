//
//  WebImageViewModel.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import SwiftUI

//  MARK: WebImageViewModel
/// Fetch image using NetworkingManager to populate
/// on SwiftUI view using WebImageView.
///
class WebImageViewModel: ObservableObject {

  // MARK: Data
  //
  @Published var image: UIImage?

  // MARK: Services
  //
  var networkingManager: NetworkingManager

  private(set) var url: URL?

  init(networkingManager: NetworkingManager = NetworkingManager(),
       url: URL?) {
    self.networkingManager = networkingManager
    self.url = url
  }
}

// MARK: Networking
extension WebImageViewModel {
  /// Get image using a url endpoint using a network request.
  ///
  func getImage() {
    guard let url = url else { return }

    networkingManager
      .getImage(atURL: url)
      .receive(on: DispatchQueue.main)
      .assign(to: &$image)
  }
}
