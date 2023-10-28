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
            AnimalsView(
                viewModel: AnimalsViewModel(
                    animalFetcher: FetchAnimalsService(requestManager: RequestManager()),
                    animalStore: PefStore.shared)
            )
            .tabItem { Label("Animals", systemImage: "cat") }
            
            BookedAnimalsView(viewModel: BookedAnimalsViewModel())
            .tabItem{ Label("Booked", systemImage: "bookmark") }
            
            SearchView()
            .tabItem { Label("Search", systemImage: "magnifyingglass") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
