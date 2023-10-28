//
//  AnimalsDetailViewModel.swift
//  PefFinder
//
//  Created by Kane on 2023/10/28.
//

import Foundation
import RealmSwift

@MainActor class AnimalDetailsViewModel: ObservableObject {
    @Published var animal: AnimalEntity
    @Published var isBooked: Bool
    init(animal: AnimalEntity) {
        self.animal = animal
        self.isBooked = animal.isBooked
    }
    
    var animalDescription: String? {
        animal.descriptionM
    }
    
    var animalName: String? {
        animal.name
    }
    
    func saveAnimal(animal: AnimalEntity, isBooked: Bool) {
//        animal.isBooked = isBooked
//        PefStore.shared.saveAnimals(animals: [animal])
    }
    
    func favoriteToggleAnimal() {
        self.isBooked.toggle()
        PefStore.shared.favoriteToggleAnimal(animal)
    }
    
//    var isBooked: Bool {
//        get { animal.isBooked }
//        set {
//            PefStore.shared.favoriteToggleAnimal(animal)
////            animal.isBooked = newValue
//        }
//    }
}
