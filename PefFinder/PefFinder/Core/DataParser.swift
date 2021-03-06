//
//  DataParser.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser: DataParserProtocol {
    private var jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func parse<T: Decodable>(data: Data) throws -> T {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
            print(json)
        }
        
        return try jsonDecoder.decode(T.self, from: data)
    }
}
