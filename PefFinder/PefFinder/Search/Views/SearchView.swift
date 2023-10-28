//
//  SearchView.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/02.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel(
        animalSearcher: AnimalSearcherService(requestManager: RequestManager())
    )
    
    @State var filterPickerIsPresented = false
    
    var filteredAnimals: [AnimalEntity] {
        guard viewModel.shouldFilter else { return [] }
        return filterAnimals()
    }
    
    private var filterAnimals: FilterAnimals {
        FilterAnimals(
            animals: viewModel.animals,
            query: viewModel.searchText,
            age: viewModel.ageSelection,
            type: viewModel.typeSelection
        )
    }
    
    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .navigationTitle("Find your future pet")
                .searchable(
                    text: $viewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                )
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.search()
                }
                .overlay {
                    if filteredAnimals.isEmpty && !viewModel.searchText.isEmpty {
                        EmptyResultsView(query: viewModel.searchText)
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button {
                            filterPickerIsPresented.toggle()
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                        .sheet(isPresented: $filterPickerIsPresented) {
                            NavigationView {
                                SearchFilterView(viewModel: viewModel)
                            }
                        }
                    }
                }
                .overlay {
                    if filteredAnimals.isEmpty && viewModel.searchText.isEmpty {
                        SuggestionsGrid(suggestions: AnimalSearchType.suggestions) { suggestion in
                            viewModel.selectTypeSuggestion(suggestion)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    }
                }
        }
    }
}

#Preview {
    SearchView(
        viewModel:SearchViewModel(animalSearcher: AnimalSearcherMock())
    )
}

