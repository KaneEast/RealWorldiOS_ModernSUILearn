//
//  AnimalsFetcherMock.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/29.
//

import Foundation

struct AnimalsFetcherMock: AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [AnimalInfo] {
        AnimalInfo.mock
    }
}

struct EmptyResponseAnimalsFetcherMock: AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [AnimalInfo] {
        return []
    }
}
