//
//  ContentView.swift
//  BlaBlaMovie
//
//  Created by Roland Lariotte on 29/03/2021.
//

import SwiftUI

//  MARK: ContentView
/// Root of all views by holding the TabView.
///
struct ContentView: View {

  @AppStorage("showWelcomeView")
  var showWelcomeViewStorage = true

  @State var showWelcomeView = false

  var body: some View {
    TabView {
      SearchMoviesView()
        .tabItem {
          Text(Localized.moviesTabItem)
          Image.movieTicket
        }
    }
    .sheet(isPresented: $showWelcomeView) {
      WelcomeView()
    }
    .onAppear {
      showWelcomeView = showWelcomeViewStorage
    }
  }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      ContentView()

      ContentView()
        .preferredColorScheme(.dark)
    }
  }
}
