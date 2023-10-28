//
//  AnimalsDetailViewModel.swift
//  PefFinder
//
//  Created by Kane on 2023/10/28.
//

import Foundation
import RealmSwift

@MainActor class AnimalDetailsViewModel: ObservableObject {
    
    func saveAnimal(animal: AnimalEntity, isBooked: Bool) {
        animal.isBooked = isBooked
        PefStore.shared.saveAnimals(animals: [animal])
    }
    
}
