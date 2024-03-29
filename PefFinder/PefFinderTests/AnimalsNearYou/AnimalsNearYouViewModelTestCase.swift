//
//  AnimalsViewModelTestCase.swift
//  PefFinderTests
//
//  Created by Kanein on 2022/07/02.
//

import XCTest
@testable import PefFinder

@MainActor
final class AnimalsViewModelTestCase: XCTestCase {
    var viewModel: AnimalsViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        viewModel = AnimalsViewModel(
            isLoading: true,
            animalFetcher: AnimalsFetcherMock(),
            animalStore: PefStore.shared
        )
    }
    
    func testFetchAnimalsLoadingState() async {
        XCTAssertTrue(viewModel.isLoading, "The view model should be loading, but it isn't")
        await viewModel.fetchAnimals()
        XCTAssertFalse(viewModel.isLoading, "The view model should'nt be loading, but it is")
    }
    
    func testUpdatePageOnFetchMoreAnimals() async {
        XCTAssertEqual(viewModel.page, 1, "the view model's page property should be 1 before fetching, but it's \(viewModel.page)")
        await viewModel.fetchMoreAnimals()
        XCTAssertEqual(viewModel.page, 2, "the view model's page property should be 2 after fetching, but it's \(viewModel.page)")
    }
    
    func testFetchAnimalsEmptyResponse() async {
        viewModel = AnimalsViewModel(
            isLoading: true,
            animalFetcher: EmptyResponseAnimalsFetcherMock(),
            animalStore: PefStore.shared
        )
        await viewModel.fetchAnimals()
        
        XCTAssertFalse(viewModel.hasMoreAnimals, "hasMoreAnimals should be false with an empty response, but it's true")
        XCTAssertFalse(viewModel.isLoading, "the view model shouldn't be loading after receiving an empty response, but it is")
    }
    
}

