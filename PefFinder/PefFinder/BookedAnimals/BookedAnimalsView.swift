//
//  BookedAnimalsView.swift
//  PefFinder
//
//  Created by Kane on 2023/10/28.
//

import SwiftUI

struct BookedAnimalsView: View {
    
    @ObservedObject var viewModel: BookedAnimalsViewModel
    
    var body: some View {
        NavigationView {
            AnimalListView(animals: viewModel.animalsInDatabase) {
//                if !viewModel.animalsInDatabase.isEmpty && viewModel.hasMoreAnimals {
//                    HStack(alignment: .center) {
//                        LoadingAnimation().frame(maxWidth: 125, minHeight: 125)
//                        Text("Loading more animals...")
//                    }
//                    .task { await viewModel.fetchMoreAnimals() }
//                }
            }
//            .task { await viewModel.fetchAnimals() }
            .navigationTitle("Booked Animals")
//            .overlay {
//                if viewModel.isLoading && viewModel.animals.isEmpty {
//                    ProgressView("Finding Animals...")
//                }
//            }
            Text("")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    BookedAnimalsView(viewModel: BookedAnimalsViewModel())
}
