//
//  BaseWorker.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 15/11/2022.
//

import Foundation

class BaseWorker{
    
    let networkClient: NetworkClientProviderProtocol
    let pathProvider: PathProviderProtocol
    let requestParameters: NetworkParameterProvider
    var authManager: AuthTokenProviderProtocol
    let networkHeader: NetworkHeaderProvider
    
    init(networkClient: NetworkClientProviderProtocol,
         pathProvider: PathProviderProtocol,
         networkParameters: NetworkParameterProvider,
         networkHeader: NetworkHeaderProvider,
         authManager: AuthTokenProviderProtocol) {
        self.networkClient = networkClient
        self.pathProvider = pathProvider
        self.requestParameters = networkParameters
        self.authManager = authManager
        self.networkHeader = networkHeader
    }
}
