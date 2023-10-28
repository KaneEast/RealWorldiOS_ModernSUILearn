//
//  RealmMockHelper.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/29.
//

import Foundation

// MARK: - Mock data
extension AnimalInfo {
    static let mock = loadAnimals()
}

extension AnimalEntity {
    static let mock = loadAnimalEntities()
}

private struct AnimalsMock: Codable {
    let animals: [AnimalInfo]
}

private func loadAnimals() -> [AnimalInfo] {
    guard let url = Bundle.main.url(forResource: "AnimalsMock", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(AnimalsMock.self, from: data)
    return jsonMock?.animals ?? []
}

private func loadAnimalEntities() -> [AnimalEntity] {
    guard let url = Bundle.main.url(forResource: "AnimalsMock", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(AnimalsMock.self, from: data)
    return convertAnimalInfoToAnimalEntity(jsonMock?.animals ?? [])
}

func convertAnimalInfoToAnimalEntity(_ animalInfos: [AnimalInfo]) -> [AnimalEntity] {
    var animalEntities = [AnimalEntity]()
    
    for animalInfo in animalInfos {
        let animalEntity = AnimalEntity()
        animalEntity.id = animalInfo.id
        animalEntity.organizationId = animalInfo.organizationId
        animalEntity.rawUrl = animalInfo.url?.absoluteString
        animalEntity.type = animalInfo.type
        animalEntity.species = animalInfo.species
        animalEntity.age = animalInfo.age
        animalEntity.gender = animalInfo.gender
        animalEntity.size = animalInfo.size
        animalEntity.coat = animalInfo.coat
        animalEntity.name = animalInfo.name
        animalEntity.descriptionM = animalInfo.descriptionM
        animalEntity.ranking = animalInfo.ranking
        animalEntity.photoMedium = animalInfo.photos.first?.medium?.absoluteString
        animalEntity.photoLarge = animalInfo.photos.first?.large?.absoluteString
        animalEntities.append(animalEntity)
    }
    
    return animalEntities
}
