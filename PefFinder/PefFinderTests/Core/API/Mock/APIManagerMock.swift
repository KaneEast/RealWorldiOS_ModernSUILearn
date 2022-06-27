//
//  APIManagerMock.swift
//  PefFinderTests
//
//  Created by Kanein on 2022/06/27.
//

import Foundation
@testable import PefFinder

struct APIManagerMock: APIManagerProtocol {
    
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
        return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
    }
    
    func requestToken() async throws -> Data {
        Data(AccessTokenTestHelper.generateValidToken().utf8)
    }
}
