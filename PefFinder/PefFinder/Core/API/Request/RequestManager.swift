//
//  RequestManager.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
    private let apiManager: APIManagerProtocol
    private let parser: DataParserProtocol
    private let accessTokenManager: AccessTokenManagerProtocol
    
    init(
        apiManager: APIManagerProtocol = APIManager(),
        parser: DataParserProtocol = DataParser(),
        accessTokenManager: AccessTokenManagerProtocol = AccessTokenManager()
    ) {
        self.apiManager = apiManager
        self.parser = parser
        self.accessTokenManager = accessTokenManager
    }
    
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let authToken = try await requestAccessToken()
        let data = try await apiManager.perform(request, authToken: authToken)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
    
    func requestAccessToken() async throws -> String {
        if accessTokenManager.isTokenValid() {
            return accessTokenManager.fetchToken()
        }
        
        let data = try await apiManager.requestToken()
        let token: APIToken = try parser.parse(data: data)
        
        try accessTokenManager.refreshWith(apiToken: token)
        return token.bearerAccessToken
    }
}
