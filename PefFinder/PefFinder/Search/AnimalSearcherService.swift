//
//  AnimalSearcherService.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

struct AnimalSearcherService {
    let requestManager: RequestManagerProtocol
}

// MARK: - AnimalSearcher
extension AnimalSearcherService: AnimalSearcher {
    func searchAnimal(by text: String, age: AnimalSearchAge, type: AnimalSearchType) async -> [AnimalEntity] {
        let requestData = AnimalsRequest.getAnimalsBy(
            name: text,
            age: age != .none ? age.rawValue : nil,
            type: type != .none ? type.rawValue : nil
        )
        
        do {
            let animalsContainer: AnimalsContainer = try await requestManager
                .perform(requestData)
            return convertAnimalInfoToAnimalEntity(animalsContainer.animals)
        } catch {
            // TODO: k throw error
            print(error.localizedDescription)
            return []
        }
    }
}
