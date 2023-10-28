//
//  BookedAnimalsViewModel.swift
//  PefFinder
//
//  Created by Kane on 2023/10/28.
//

import Foundation
import RealmSwift

@MainActor class BookedAnimalsViewModel: ObservableObject {
    
//    var animalStore: AnimalStore
    
    // animalsInDatabase observe
    @ObservedResults(AnimalEntity.self, where: { $0.id != nil }) var animalsInDatabase
    
//    init(animalStore: AnimalStore) {
//        self.animalStore = animalStore
//    }
//    
//    func fetchAnimals() {
//        
//    }
}
