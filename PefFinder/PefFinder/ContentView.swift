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
//            AnimalsNearYouView(viewModel: AnimalsNearYouViewModel())
            AnimalsNearYouView(
              viewModel: AnimalsNearYouViewModel(
                animalFetcher: FetchAnimalsService(requestManager: RequestManager())
              )
            )
            .tabItem {
                Label("Near you", systemImage: "location")
            }
            
            Text("test")
            .tabItem {
                Label("Test", systemImage: "location")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
