//
//  PefStore.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/28.
//

import Foundation
import RealmSwift

protocol AnimalStore {
    func saveAnimals(animals: [Animal])
    func getAnimals() ->  [Animal]
    func clearAnimals()
}

class PefStore: AnimalStore {
    static let shared = PefStore()
    let realm = try! Realm()
    
    func saveAnimals(animals: [Animal]) {
        try! realm.write {
            realm.add(animals)
        }
    }
    
    func getAnimals() ->  [Animal] {
        Array(realm.objects(Animal.self))
    }
    
    func clearAnimals() {
        try? realm.write {
            realm.delete(realm.objects(Animal.self))
        }
    }
}

// TODO: test CURD?
