//
//  AnimalsRequest.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

enum AnimalsRequest: RequestProtocol {
    case getAnimalsWith(page: Int)
    case getAnimalsBy(name: String, age: String?, type: String?)
    
    var path: String { "/v2/animals" }
    var requestType: RequestType { .GET }
    var urlParams: [String: String?] {
        switch self {
        case let .getAnimalsWith(page):
            var params = ["page": String(page)]
            params["sort"] = "random"
            return params
            
        case let .getAnimalsBy(name, age, type):
            var params: [String: String] = [:]
            if !name.isEmpty {
                params["name"] = name
            }
            
            if let age = age {
                params["age"] = age
            }
            
            if let type = type {
                params["type"] = type
            }
            return params
        }
    }
}
