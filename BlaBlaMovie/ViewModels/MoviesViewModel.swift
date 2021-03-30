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
  var alertManager: AlertProtocol
  var networkingManager: NetworkingManager

  // MARK: UILevers
  //
  @Published var showAlert = false

  init(alertManager: AlertProtocol = AlertManager(),
       networkingManager: NetworkingManager = NetworkingManager()) {
    self.alertManager = alertManager
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
        receiveCompletion: { [weak self] completion in
          self?.handleNetworkRequest(completion)
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

  /// Trigger failure or finished actions on network request completion.
  ///
  /// - Parameter completion: Network Request completion with error if any.
  ///
  func handleNetworkRequest(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .failure(let error):
      triggerCompletion(error)
      return
    case .finished:
      return
    }
  }

  /// Switch the NetworkError from api call to trigger
  /// specific Alert.
  ///
  /// - Parameter error: NetworkError from api.
  ///
  func triggerCompletion(_ error: Error) {
    switch error {
    case NetworkError.internalServerError:
      triggerAlert(.internalServerError)
      return
    case NetworkError.invalidResponse:
      triggerAlert(.invalidResponse)
      return
    case NetworkError.notFound:
      triggerAlert(.notFound)
      return
    case NetworkError.unauthorized:
      triggerAlert(.unauthorized)
      return
    default:
      triggerAlert(.unknown)
      return
    }
  }

  /// Trigger alert from AlertManager service.
  ///
  /// - Parameter alert: Custom alert
  ///
  func triggerAlert(_ alert: BlaBlaMovieAlert) {
    alertManager.trigger(alert, &showAlert)
  }
}
