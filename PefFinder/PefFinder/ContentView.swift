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
            AnimalsView().tabItem { Label("Animals", systemImage: "cat") }
            BookedAnimalsView().tabItem{ Label("Booked", systemImage: "bookmark") }
            SearchView().tabItem { Label("Search", systemImage: "magnifyingglass") }
        }
        .onAppear {
            //applyNavigationBarAppearance()
        }
    }
    
    func applyNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color.blue.opacity(0.25))
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
