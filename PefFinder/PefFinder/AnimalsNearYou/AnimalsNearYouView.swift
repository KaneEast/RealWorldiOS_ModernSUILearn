//
//  AnimalsNearYouView.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import SwiftUI

struct AnimalsNearYouView: View {
    @ObservedObject var viewModel: AnimalsNearYouViewModel
    
    var body: some View {
        NavigationView {
            List {
//                ForEach(viewModel.animals) { animal in
                ForEach(viewModel.animalsInDatabase) { animal in
                    AnimalRow(animal: animal)
                }
                
                if !viewModel.animals.isEmpty && viewModel.hasMoreAnimals {
                  ProgressView("Finding more animals...")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .task {
                      await viewModel.fetchMoreAnimals()
                    }
                }
            }
            .task {
                await viewModel.fetchAnimals()
            }
            .listStyle(.plain)
            .navigationTitle("Animals near you")
            .overlay {
                if viewModel.isLoading && viewModel.animals.isEmpty {
                    ProgressView("Finding Animals near you...")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView(
//            viewModel: AnimalsNearYouViewModel(
//                animalFetcher: FetchAnimalsService(requestManager: RequestManager())
//            )
            viewModel: AnimalsNearYouViewModel(
              animalFetcher: AnimalsFetcherMock()
            )

        )
    }
    
    // TODO: Make MockDB?
//    init() {
//        if PefStore.shared.getAnimals().isEmpty {
//            PefStore.shared.saveAnimals(animals: Animal.mock)
//        }
//    }
}
