//
//  MoviesViewModel.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 30/03/2021.
//

import Combine
import Foundation

//  MARK: MoviesViewModel
/// Handle SearchMoviesView as Parent and some of its
/// children views.
///
final class MoviesViewModel: ObservableObject {

  var subscriptions = Set<AnyCancellable>()

  // MARK: Data
  //
  @Published var favoritedMoviesID = [String]()
  @Published var movieData: MovieData?
  @Published var moviesData = [SearchResultData]()
  @Published var selectedMovie: SearchResultData?

  // MARK: Services
  //
  var alertManager: AlertProtocol
  var networkingManager: NetworkingManager

  // MARK: UILevers
  //
  @Published var isMovieSelected = false 
  @Published var isProgressViewOn = false
  @Published var showAlert = false

  init(alertManager: AlertProtocol = AlertManager(),
       networkingManager: NetworkingManager = NetworkingManager()) {
    self.alertManager = alertManager
    self.networkingManager = networkingManager
  }
}

// MARK: - Networking
extension MoviesViewModel {
  /// Fetch one movie from the api to show its details.
  ///
  /// - Parameters:
  ///   - imdbID: Movie id found in MoviesData.
  ///   - successHandler: Used to handle actions on success
  ///   inside the SwiftUI view navigation to avoid an Apple
  ///   bug when triggering action from the view model. That
  ///   might be fix in iOS 15.
  ///   - completionHandler: Use to pass actions at the end of the
  ///   network calls and can be used for testing purposes.
  ///
  func getMovie(_ imdbID: String,
                successHandler: @escaping (() -> Void) = {},
                completionHandler: @escaping (() -> Void) = {}) {
    showProgressView(true)

    networkingManager
      .get(MovieData.self, atURL: .movie(imdbID))
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] completion in
          self?.handleNetworkRequest(completion)
          completionHandler() },
        receiveValue: { [weak self] data in
          self?.movieData = data
          successHandler() })
      .store(in: &subscriptions)
  }

  /// Fetch movies of a particular type from the api.
  ///
  /// - Parameters:
  ///   - name: Movie type name to search in the api.
  ///   - completionHandler: Use to pass actions at the end of the
  ///   network calls and can be used for testing purposes.
  ///
  func getMovies(_ name: String, completionHandler: @escaping (() -> Void) = {}) {
    showProgressView(true)

    networkingManager
      .get(MoviesSearchData.self, atURL: .searchMovies(name))
      .receive(on: DispatchQueue.main)
      .map { $0.search.sorted { $0.title < $1.title }}
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
  func handleSearchMovies(_ data: [SearchResultData]) {
    moviesData.removeAll()
    moviesData.append(contentsOf: data)
  }

  /// Trigger failure or finished actions on network request completion.
  ///
  /// - Parameter completion: Network Request completion with error if any.
  ///
  func handleNetworkRequest(_ completion: Subscribers.Completion<Error>) {
    showProgressView(false)

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

  /// Trigger action to show/hide ProgressView
  ///
  /// - Parameter action: true/false show ProgressView.
  ///
  func showProgressView(_ action: Bool) {
    isProgressViewOn = action
  }
}

// MARK: - Favorites
extension MoviesViewModel {
  /// Selection of the favorited movies.
  /// - Parameters:
  ///   - imdbID: Movie id.
  ///   - completionHandler: Perform actions inside SwiftUI views
  /// when triggered.
  ///
  func selectFavoriteMovie(id imdbID: String,
                           completionHandler: @escaping (() -> Void)) {
    if favoritedMoviesID.contains(imdbID) {
      favoritedMoviesID = favoritedMoviesID.filter { $0 != imdbID }
      completionHandler()
    }
    else if favoritedMoviesID.count >= 3 {
      triggerAlert(.maxFavoritesReached)
    }
    else {
      completionHandler()
      favoritedMoviesID.append(imdbID)
    }
  }
}
