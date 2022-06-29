//
//  AnimalsNearYouViewModel.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation
import RealmSwift

class AnimalsNearYouViewModel: ObservableObject {
    private let requestManager = RequestManager()
    
    @Published var animals: [Animal] = []
    @Published var isLoading: Bool = false
    
    // animalsInDatabase observe
    @ObservedResults(
        Animal.self,
        where: { $0.id != nil }
    ) var animalsInDatabase

    
    func fetchAnimals() async {
        do {
            isLoading = true
            let animalsContainer: AnimalsContainer = try await requestManager.perform(
                AnimalsRequest.getAnimalsWith(
                    page: 1,
                    latitude: nil,
                    longitude: nil
                )
            )
            
            print("123")
            DispatchQueue.main.async {
                self.isLoading = false
                
                // save first page
                if self.animals.isEmpty {
                    PefStore.shared.saveAnimals(animals: animalsContainer.animals)
                }
                
                self.animals = animalsContainer.animals
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
