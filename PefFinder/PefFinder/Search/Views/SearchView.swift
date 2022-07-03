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
    
    var filteredAnimals: [Animal] {
      guard viewModel.shouldFilter else { return [] }
      return filterAnimals()
    }

    @State var filterPickerIsPresented = false

    private var filterAnimals: FilterAnimals {
      FilterAnimals(
        animals: viewModel.animals,
        query: viewModel.searchText,
        age: viewModel.ageSelection,
        type: viewModel.typeSelection
      )
    }
    
    var body: some View {
//        NavigationView {
//            List {
//                ForEach(viewModel.animals) { animal in
//                    NavigationLink(destination: AnimalDetailsView(animal: animal)) {
//                        AnimalRow(animal: animal)
//                    }
//                }
//            }
//            .listStyle(.plain)
//            .navigationTitle("Find your future pet")
//        }.navigationViewStyle(StackNavigationViewStyle())
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        //        Text("")
        SearchView(
            viewModel: SearchViewModel(
                animalSearcher: AnimalSearcherMock()                )
        )
    }
}
