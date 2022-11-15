//
//  AppBuilder.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation


class AppBuilder {
    var networkService: NetworkServiceProtocol {
        return buildNetworkService()
    }
}

private extension AppBuilder {
    func buildNetworkService() -> NetworkServiceProtocol {
        let networkService = NetworkClient()
        let pathProvider = PathProvider(environmentProvider: Environment(type: .prod))
        let networkHeader = NetworkHeaderProviderImplementation()
        let parameters = NetworkParameter()
        let authManager = AuthManager()
        return NetworkService(networkService: networkService,
                                   path: pathProvider,
                                   networkHeader: networkHeader,
                                   parameters: parameters,
                                   authManager: authManager)
    }
}
