//
//  AuthManager.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation

protocol AuthManagerProtocol {
    var authTokens: AuthTokens? { set get }
    func clear()
}

struct AuthTokens: Codable {
    var accessToken: String
    var refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "token"
        case refreshToken = "refresh_token"
    }
}

class AuthManager: AuthManagerProtocol {
    var authTokens: AuthTokens?
    func clear() {
    }
    required init() {
    }
}
