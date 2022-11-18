//
//  AuthManager.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation



struct AuthTokens: Codable {
    var accessToken: String
    var refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "token"
        case refreshToken = "refresh_token"
    }
}

class AuthManager: AuthTokenProviderProtocol {
    func requestAuthToken(closure: @escaping Success) {
        
    }
    required init() {
    }
}
