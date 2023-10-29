//
//  AnimalSearcherMock.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

import Foundation

struct AnimalSearcherMock: AnimalSearcher {
    func searchAnimal(by text: String, age: AnimalSearchAge, type: AnimalSearchType) async -> [AnimalEntity] {
        var animals = AnimalEntity.mock
        if age != .none {
            animals = animals.filter {
                $0.age.rawValue.lowercased() == age.rawValue.lowercased()
            }
        }
        if type != .none {
            animals = animals.filter {
                $0.type.lowercased() == type.rawValue.lowercased()
            }
        }
        return animals.filter { $0.name.contains(text) }
    }
}
