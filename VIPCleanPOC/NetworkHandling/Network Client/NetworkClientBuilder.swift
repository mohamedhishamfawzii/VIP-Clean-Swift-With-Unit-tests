//
//  NetworkClientBuilder.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 18/11/2022.
//

import Foundation
class NetworkClientBuilder {
    static var network: NetworkClient!
    
    static func build() -> NetworkClient {
        let wafErrorHandler = WafErrorHandler()
        let generalErrorHandler = GeneralErrorHandler()
        let authTokenProvider = AuthManager()
        let appErrorProvider = AppErrorProvider(wafError: wafErrorHandler,
                                                generalError: generalErrorHandler)
        network = NetworkClient(authProvider: authTokenProvider,
                                errorProvider: appErrorProvider)
        return network
    }
}
