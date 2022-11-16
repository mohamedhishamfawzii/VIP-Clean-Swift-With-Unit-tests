//
//  NetworkService.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
   
   var exampleWorker: ExampleWorkerProtocol {
       return makeExampleWorker()
   }

   private let networkService: NetworkClientProtocol
   private let pathProvider: PathProviderProtocol
   private let networkHeader: NetworkHeaderProvider
   private let networkParameters: NetworkParameterProvider
   
   let authManager: AuthManagerProtocol
   
   init(networkService: NetworkClientProtocol,
        path: PathProviderProtocol,
        networkHeader: NetworkHeaderProvider,
        parameters: NetworkParameterProvider,
        authManager: AuthManagerProtocol) {
       self.networkService = networkService
       self.pathProvider = path
       self.networkParameters = parameters
       self.networkHeader = networkHeader
       self.authManager = authManager
   }
}
extension NetworkService {
func makeExampleWorker() -> ExampleWorker {
            return ExampleWorker(networkService: networkService,
                                 pathProvider: pathProvider,
                                 networkParameters: networkParameters,
                                 networkHeader: networkHeader,
                                 authManager: authManager)
        }
}
