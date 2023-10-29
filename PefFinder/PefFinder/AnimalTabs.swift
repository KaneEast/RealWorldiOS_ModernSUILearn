//
//  AnimalsTab.swift
//  PefFinder
//
//  Created by Kane on 2023/10/30.
//

import Combine
import SwiftData
import SwiftUI

@MainActor
struct AnimalsTab: View {
    @State private var routerPath = RouterPath()
    var body: some View {
        NavigationStack(path: $routerPath.path) { AnimalsView().withAppRouter() }
        .environment(routerPath)
        .tabItem { Label("Animals", systemImage: "cat") }
    }
}

@MainActor
struct BookedTab: View {
    @State private var routerPath = RouterPath()
    var body: some View {
        NavigationStack(path: $routerPath.path) { BookedAnimalsView().withAppRouter() }
        .environment(routerPath)
        .tabItem{ Label("Booked", systemImage: "bookmark") }
    }
}

@MainActor
struct SearchTab: View {
    @State private var routerPath = RouterPath()
    var body: some View {
        NavigationStack(path: $routerPath.path) { SearchView().withAppRouter() }
        .environment(routerPath)
        .tabItem { Label("Search", systemImage: "magnifyingglass") }
    }
}

extension View {
    func withAppRouter() -> some View {
        navigationDestination(for: RouterDestination.self) { destination in
            switch destination {
            case .animals:
                AnimalsView()
            case .booked:
                BookedAnimalsView()
            case .search:
                SearchView()
            case .animalDetail:
                EmptyView()
            }
        }
    }
}
