//
//  AnimalsViewModel.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation
import RealmSwift

protocol AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [AnimalInfo]
}

// @MainActorアノテーションは、このクラスで実行されるすべてのコードがメインスレッド内にあることを確認します。
// FetchAnimalsServiceから結果を受け取ると、実行がメインスレッドに戻るため、
// メインスレッドの外部でUIを更新することを恐れずに、公開プロパティを更新できます。
@MainActor class AnimalsViewModel: ObservableObject {
    @Published var animals: [AnimalEntity] = []
    @Published var isLoading: Bool = false
    @Published var hasMoreAnimals = true
    private(set) var page = 1
    private let animalFetcher: AnimalsFetcher
    var animalStore: AnimalStore
    
    init(isLoading: Bool = true,
         animalFetcher: AnimalsFetcher = FetchAnimalsService(requestManager: RequestManager()),
         animalStore: AnimalStore = PefStore.shared) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
        self.animalStore = animalStore
    }
    
    func fetchAnimals() async {
        isLoading = true
        let animals = await animalFetcher.fetchAnimals(page: page)
        let animalEntityArray = convertAnimalInfoToAnimalEntity(animals)
        
        self.isLoading = false
        
        // save first page
        if self.animals.isEmpty {
            self.animals = animalEntityArray
            animalStore.saveAnimals(animals: animalEntityArray)
        } else {
            self.animals += animalEntityArray
        }
        
        hasMoreAnimals = !animals.isEmpty
    }
    
    func fetchMoreAnimals() async {
        page += 1
        await fetchAnimals()
    }
}
