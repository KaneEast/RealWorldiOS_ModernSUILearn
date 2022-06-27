//
//  AccessTokenTestHelper.swift
//  PefFinderTests
//
//  Created by Kanein on 2022/06/27.
//

@testable import PefFinder

enum AccessTokenTestHelper {
    // 長さ8のランダムな文字列を返す
    static func randomString() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String(letters.shuffled().prefix(8))
    }
    
    static func randomAPIToken() -> APIToken {
        return APIToken(tokenType: "Bearer", expiresIn: 10,
                        accessToken: AccessTokenTestHelper.randomString())
    }
    
    // アプリがPetfinderAPIから受け取ったものと同様のランダムトークンデータを生成
    static func generateValidToken() -> String {
    """
    {
      "token_type": "Bearer",
      "expires_in": 10,
      "access_token": \"\(randomString())\"
    }
    """
    }
}
