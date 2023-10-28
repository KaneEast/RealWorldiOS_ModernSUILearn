//
//  PefStore.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/28.
//

import Foundation
import RealmSwift

protocol AnimalStore {
    func saveAnimals(animals: [AnimalEntity])
    func getAnimals() ->  [AnimalEntity]
    func clearAnimals()
}

class PefStore: AnimalStore {
    static let shared = PefStore()
    let realm = try! Realm()
    
    func saveAnimals(animals: [AnimalEntity]) {
        try? realm.write {
            realm.add(animals, update: .modified)
        }
    }
    
    func getAnimals() ->  [AnimalEntity] {
        Array(realm.objects(AnimalEntity.self))
    }
    
    func clearAnimals() {
        try? realm.write {
            realm.delete(realm.objects(AnimalEntity.self))
        }
    }
}
