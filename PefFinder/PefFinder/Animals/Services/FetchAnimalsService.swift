//
//  FetchAnimalsService.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/29.
//

import Foundation

struct FetchAnimalsService {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

// MARK: - AnimalFetcher
extension FetchAnimalsService: AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [AnimalInfo] {
        let requestData = AnimalsRequest.getAnimalsWith(page: page)
        do {
            let animalsContainer: AnimalsContainer = try await requestManager.perform(requestData)
            return animalsContainer.animals
        } catch {
            // TODO: k
            print(error.localizedDescription)
            return []
        }
    }
}
