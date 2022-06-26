//
//  AuthTokenRequest.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

enum AuthTokenRequest: RequestProtocol {
    case auth
    // トークンをフェッチするためのエンドポイント
    var path: String {
        "/v2/oauth2/token"
    }
    
    var params: [String: Any] {
        [
            "grant_type": APIConstants.grantType,
            "client_id": APIConstants.clientId,
            "client_secret": APIConstants.clientSecret
        ]
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    var requestType: RequestType {
        .POST
    }
}
