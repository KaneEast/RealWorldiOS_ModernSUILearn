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
    
    func fetchAnimals() async {
      do {
        // 1
        let animalsContainer: AnimalsContainer =
          try await requestManager.perform(AnimalsRequest.getAnimalsWith(
            page: 1,
            latitude: nil,
            longitude: nil))
        // 2
        self.animals = animalsContainer.animals
        // 3
//        await stopLoading()
      } catch {}
    }

}
