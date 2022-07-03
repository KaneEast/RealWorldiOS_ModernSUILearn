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
  func searchAnimal(
    by text: String,
    age: AnimalSearchAge,
    type: AnimalSearchType
  ) async -> [Animal] {
    // 3
    let requestData = AnimalsRequest.getAnimalsBy(
      name: text,
      age: age != .none ? age.rawValue : nil,
      type: type != .none ? type.rawValue : nil
    )
    // 4
    do {
      let animalsContainer: AnimalsContainer = try await requestManager
        .perform(requestData)
      return animalsContainer.animals
    } catch {
      // 5
      print(error.localizedDescription)
      return []
    }
  }
}
