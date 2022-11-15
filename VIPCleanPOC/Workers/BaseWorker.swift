//
//  BaseWorker.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 15/11/2022.
//

import Foundation

class BaseWorker{
    
    let networkService: NetworkClientProtocol
    let pathProvider: PathProviderProtocol
    let requestParameters: NetworkParameterProvider
    var authManager: AuthManagerProtocol
    let networkHeader: NetworkHeaderProvider
    
    init(networkService: NetworkClientProtocol,
         pathProvider: PathProviderProtocol,
         networkParameters: NetworkParameterProvider,
         networkHeader: NetworkHeaderProvider,
         authManager: AuthManagerProtocol) {
        self.networkService = networkService
        self.pathProvider = pathProvider
        self.requestParameters = networkParameters
        self.authManager = authManager
        self.networkHeader = networkHeader
    }
}
