//
//  RequestProtocol.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

enum RequestType: String {
  case GET
  case POST
}

protocol RequestProtocol {
    /// ベースURLの最後に付加されるエンドポイント
    var path: String { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    /// クエリパラメータ
    var urlParams: [String: String?] { get }
    /// リクエストで認証トークンを追加する必要があるかどうか
    var addAuthorizationToken: Bool { get }
    var requestType: RequestType { get }
}


extension RequestProtocol {
    var host: String { APIConstants.host }
    // デフォルトでは、すべてのリクエストに認証トークンがあり
    var addAuthorizationToken: Bool { true }
    var params: [String: Any] { [:] }
    var urlParams: [String: String?] { [:] }
    var headers: [String: String] { [:] }
    
    // 無効なURLなどの失敗の場合にエラーをスローする認証トークンを使用してリクエストを作成する
    func createURLRequest(authToken: String) throws -> URLRequest {
        // URLの基本コンポーネントを設定
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        // リクエストに認証トークンを追加
        if addAuthorizationToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}


