//
//  BookedAnimalsViewModel.swift
//  PefFinder
//
//  Created by Kane on 2023/10/28.
//

import Foundation
import RealmSwift

@MainActor class BookedAnimalsViewModel: ObservableObject {
    
    @Published var bookedAnimals: [AnimalEntity] = []
    
    func fetch() {
        self.bookedAnimals = PefStore.shared.getAnimals().filter { $0.isBooked }
    }
}
