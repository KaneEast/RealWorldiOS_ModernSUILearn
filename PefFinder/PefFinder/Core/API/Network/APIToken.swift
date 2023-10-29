//
//  APIToken.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

struct APIToken {
    let tokenType: String          // The type of the token (e.g., "Bearer").
    let expiresIn: Int             // The duration in seconds for which the token is valid.
    let accessToken: String        // The actual access token value.
    private let requestedAt = Date()  // A timestamp for when the token was requested.
}

// MARK: - Codable
extension APIToken: Codable {
    enum CodingKeys: String, CodingKey {
        case tokenType
        case expiresIn
        case accessToken
    }
        
    // MARK: - Helper properties
    var expiresAt: Date { Calendar.current.date(byAdding: .second, value: expiresIn, to: requestedAt) ?? Date() }
    var bearerAccessToken: String { "\(tokenType) \(accessToken)" }
}
