//
//  FilterAnimals.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

import Foundation

struct FilterAnimals {
    let animals: [AnimalEntity]
    let query: String
    let age: AnimalSearchAge
    let type: AnimalSearchType
    
    func callAsFunction() -> [AnimalEntity] {
        let ageText = age.rawValue.lowercased()
        let typeText = type.rawValue.lowercased()
        
        return animals.filter {
            if ageText != "none" {
                return $0.age.rawValue.lowercased() == ageText
            }
            return true
        }
        .filter {
            if typeText != "none" {
                return $0.type.lowercased() == typeText
            }
            return true
        }
        .filter {
            if query.isEmpty {
                return true
            }
            return $0.name.contains(query)
        }
    }
}
