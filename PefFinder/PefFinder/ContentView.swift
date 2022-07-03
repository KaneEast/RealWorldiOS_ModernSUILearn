//
//  ContentView.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AnimalsNearYouView(
              viewModel: AnimalsNearYouViewModel(
                animalFetcher: FetchAnimalsService(requestManager: RequestManager()), animalStore: PefStore.shared
              )
            )
            .tabItem {
                Label("Near you", systemImage: "location")
            }
            
            SearchView()
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
