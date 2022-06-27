//
//  AnimalsRequestMock.swift
//  PefFinderTests
//
//  Created by Kanein on 2022/06/27.
//

import Foundation
@testable import PefFinder

enum AnimalsRequestMock: RequestProtocol {
    case getAnimals
    
    var requestType: RequestType {
        return .GET
    }
    
    var path: String {
        guard let path = Bundle.main.path(
            forResource: "AnimalsMock", ofType: "json")
        else { return "" }
        return path
    }
}
