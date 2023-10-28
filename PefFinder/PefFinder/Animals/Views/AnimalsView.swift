//
//  AnimalsView.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import SwiftUI

struct AnimalsView: View {
    @ObservedObject var viewModel: AnimalsViewModel
    
    var body: some View {
        NavigationView {
            AnimalListView(animals: viewModel.animals) {
                if !viewModel.animals.isEmpty && viewModel.hasMoreAnimals {
                    HStack(alignment: .center) {
                        LoadingAnimation().frame(maxWidth: 125, minHeight: 125)
                        Text("Loading more animals...")
                    }
                    .task { await viewModel.fetchMoreAnimals() }
                }
            }
            .task { await viewModel.fetchAnimals() }
            .navigationTitle("Animals")
            .overlay {
                if viewModel.isLoading && viewModel.animals.isEmpty {
                    ProgressView("Finding Animals...")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AnimalsView(
        viewModel: AnimalsViewModel(
            animalFetcher: AnimalsFetcherMock(),
            animalStore: PefStore.shared
        )
    )
}
