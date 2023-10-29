//
//  SearchViewModel.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/02.
//

import Foundation

protocol AnimalSearcher {
    func searchAnimal(by text: String, age: AnimalSearchAge, type: AnimalSearchType) async -> [AnimalEntity]
}

//@MainActor
final class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var ageSelection = AnimalSearchAge.none
    @Published var typeSelection = AnimalSearchType.none
    @Published var animals: [AnimalEntity] = []
    
    var shouldFilter: Bool {
        !searchText.isEmpty || ageSelection != .none || typeSelection != .none
    }
    
    private let animalSearcher: AnimalSearcher
    
    init(animalSearcher: AnimalSearcher) {
        self.animalSearcher = animalSearcher
    }
    
    func search() {
        Task {
            let animals = await animalSearcher.searchAnimal(
                by: searchText,
                age: ageSelection,
                type: typeSelection
            )
            
            DispatchQueue.main.async {
                self.animals = animals
            }
        }
    }
    
    func clearFilters() {
        typeSelection = .none
        ageSelection = .none
    }
    
    func selectTypeSuggestion(_ type: AnimalSearchType) {
        typeSelection = type
        search()
    }
}
