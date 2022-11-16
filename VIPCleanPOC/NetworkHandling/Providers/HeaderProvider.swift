//
//  HeaderProvider.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation

protocol NetworkHeaderProvider {
    func authorizedHeader(authToken: String) -> NetworkHTTPHeaders
}

class NetworkHeaderProviderImplementation: NetworkHeaderProvider {
    func authorizedHeader(authToken: String) -> NetworkHTTPHeaders {
        return [
            "Authorization": "Bearer \(authToken)"
        ]
    }
}
