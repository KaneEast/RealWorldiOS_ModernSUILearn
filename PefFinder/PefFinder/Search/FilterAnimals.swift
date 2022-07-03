//
//  FilterAnimals.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

import Foundation

struct FilterAnimals {
    // 2
    let animals: [Animal]
    let query: String
    let age: AnimalSearchAge
    let type: AnimalSearchType
    
    // 3
    func callAsFunction() -> [Animal] {
        let ageText = age.rawValue.lowercased()
        let typeText = type.rawValue.lowercased()
        // 4
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
