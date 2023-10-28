//
//  RealmMockHelper.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/29.
//

import Foundation

// MARK: - Mock data
extension Animal {
    static let mock = loadAnimals()
}

private struct AnimalsMock: Codable {
    let animals: [Animal]
}

private func loadAnimals() -> [Animal] {
    guard let url = Bundle.main.url(forResource: "AnimalsMock", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(AnimalsMock.self, from: data)
    return jsonMock?.animals ?? []
}
