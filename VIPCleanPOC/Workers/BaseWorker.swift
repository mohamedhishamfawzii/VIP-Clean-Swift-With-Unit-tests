//
//  BaseWorker.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 15/11/2022.
//

import Foundation

class BaseWorker{
    
    let networkClient: NetworkClientProtocol
    let pathProvider: PathProviderProtocol
    let requestParameters: NetworkParameterProvider
    var authManager: AuthManagerProtocol
    let networkHeader: NetworkHeaderProvider
    
    init(networkClient: NetworkClientProtocol,
         pathProvider: PathProviderProtocol,
         networkParameters: NetworkParameterProvider,
         networkHeader: NetworkHeaderProvider,
         authManager: AuthManagerProtocol) {
        self.networkClient = networkClient
        self.pathProvider = pathProvider
        self.requestParameters = networkParameters
        self.authManager = authManager
        self.networkHeader = networkHeader
    }
}
