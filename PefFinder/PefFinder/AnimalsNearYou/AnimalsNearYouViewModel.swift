//
//  AnimalsNearYouViewModel.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

class AnimalsNearYouViewModel: ObservableObject {
    private let requestManager = RequestManager()
    
    @Published var animals: [Animal] = []
    @Published var isLoading: Bool = false
    
    func fetchAnimals() async {
        do {
            isLoading = true
            let animalsContainer: AnimalsContainer =
            try await requestManager.perform(
                AnimalsRequest.getAnimalsWith(
                    page: 1,
                    latitude: nil,
                    longitude: nil)
            )
            
            print("123")
            DispatchQueue.main.async {
                self.isLoading = false
                self.animals = animalsContainer.animals
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
