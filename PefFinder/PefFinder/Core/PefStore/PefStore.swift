//
//  PefStore.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/28.
//

import Foundation
import RealmSwift

class PefStore {
    static let shared = PefStore()
    private let realm = try! Realm()
    
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
