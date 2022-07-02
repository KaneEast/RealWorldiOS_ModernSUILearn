//
//  AnimalsNearYouViewModel.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation
import RealmSwift

protocol AnimalsFetcher {
    func fetchAnimals(page: Int) async -> [Animal]
}

// @MainActorアノテーションは、このクラスで実行されるすべてのコードがメインスレッド内にあることを確認します。
// FetchAnimalsServiceから結果を受け取ると、実行がメインスレッドに戻るため、
// メインスレッドの外部でUIを更新することを恐れずに、公開プロパティを更新できます。
@MainActor
class AnimalsNearYouViewModel: ObservableObject {
    private let animalFetcher: AnimalsFetcher
    
    
    @Published var animals: [Animal] = []
    @Published var isLoading: Bool = false
    @Published var hasMoreAnimals = true
    private(set) var page = 1
    
    
    // animalsInDatabase observe
    @ObservedResults(
        Animal.self,
        where: { $0.id != nil }
    ) var animalsInDatabase
    
    init(isLoading: Bool = true, animalFetcher: AnimalsFetcher) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
    }
    
    func fetchAnimals() async {
        isLoading = true
        let animals = await animalFetcher.fetchAnimals(page: page)
        
        self.isLoading = false
        
        // save first page
        if self.animals.isEmpty {
            self.animals = animals
            PefStore.shared.saveAnimals(animals: animals)
        } else {
            self.animals += animals
        }
        
        hasMoreAnimals = !animals.isEmpty
    }
    
    func fetchMoreAnimals() async {
        page += 1
        await fetchAnimals()
    }
    
}
