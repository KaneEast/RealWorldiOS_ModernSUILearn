//
//  BookedAnimalsView.swift
//  PefFinder
//
//  Created by Kane on 2023/10/28.
//
import SwiftUI

struct BookedAnimalsView: View {
    @StateObject var viewModel = BookedAnimalsViewModel()
    
    var body: some View {
        NavigationView {
            AnimalListView(animals: viewModel.bookedAnimals) {
            }
            .navigationTitle("Booked Animals")
            .overlay {
                if viewModel.bookedAnimals.isEmpty {
                    Text("No Animal Booked")
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    BookedAnimalsView()
}
