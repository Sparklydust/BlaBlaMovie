//
//  MoviesViewModel.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Combine
import Foundation

final class MoviesViewModel: ObservableObject {

  var subscriptions = Set<AnyCancellable>()

  // MARK: Data
  //
  @Published var moviesData = [SearchResultModel]()

  // MARK: Services
  //
  var networkingManager: NetworkingManager

  init(networkingManager: NetworkingManager = NetworkingManager()) {
    self.networkingManager = networkingManager
  }
}

// MARK: - Networking
extension MoviesViewModel {
  /// Fetch movies of a particular type from the api.
  ///
  /// - Parameters:
  ///   - name: Movie type name to search in the api.
  ///   - completionHandler: Use to pass actions at the end of the
  ///   network calls and can be used for testing purposes.
  ///
  func getMovies(_ name: String, completionHandler: @escaping (() -> Void) = {}) {
    networkingManager
      .get(MoviesSearchData.self, atURL: .searchMovies(name))
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { completion in
          completionHandler() },
        receiveValue: { [weak self] data in
          self?.handleSearchMovies(data) })
      .store(in: &subscriptions)
  }

  /// Handle the result of the network call when data comes back
  ///
  /// - Parameter data: Searched movies from the api.
  ///
  func handleSearchMovies(_ data: MoviesSearchData) {
    moviesData.removeAll()
    moviesData = data.search
  }
}
