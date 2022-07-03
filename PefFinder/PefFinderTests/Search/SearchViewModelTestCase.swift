//
//  SearchViewModelTestCase.swift
//  PefFinderTests
//
//  Created by Kanein on 2022/07/03.
//

import Foundation
import XCTest
@testable import PefFinder

final class SearchViewModelTestCase: XCTestCase {
    // swiftlint:disable:next implicitly_unwrapped_optional
    var viewModel: SearchViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel(
            animalSearcher: AnimalSearcherMock()
        )
    }
    
    func testShouldFilterIsFalseForEmptyFilters() {
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertFalse(viewModel.shouldFilter)
    }
    
    func testClearFiltersSearchTextIsNotEmpty() {
        viewModel.typeSelection = .cat
        viewModel.ageSelection = .baby
        viewModel.searchText = "Kiki"
        
        viewModel.clearFilters()
        
        XCTAssertFalse(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertTrue(viewModel.shouldFilter)
    }
    
    func testClearFiltersSearchTextIsEmpty() {
        viewModel.typeSelection = .cat
        viewModel.ageSelection = .baby
        
        viewModel.clearFilters()
        
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertFalse(viewModel.shouldFilter)
    }
    
    func testSelectTypeSuggestion() {
        viewModel.selectTypeSuggestion(.cat)
        
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .cat)
        XCTAssertTrue(viewModel.shouldFilter)
    }
    
}
