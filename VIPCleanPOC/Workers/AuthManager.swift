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
    var authTokens: AuthTokens? {
        set {
            DataStorageManager.shared.save(newValue?.accessToken, for: .accessToken)
            DataStorageManager.shared.save(newValue?.refreshToken, for: .refreshToken)
        }
        get {
            let accessToken = DataStorageManager.shared.fetch(for: .accessToken) ?? ""
            let refershToken = DataStorageManager.shared.fetch(for: .refreshToken) ?? ""
            return AuthTokens(accessToken: accessToken, refreshToken: refershToken)
        }
    }

    func requestAuthToken(closure: @escaping Success) {
        
    }
    required init() {
    }
}
