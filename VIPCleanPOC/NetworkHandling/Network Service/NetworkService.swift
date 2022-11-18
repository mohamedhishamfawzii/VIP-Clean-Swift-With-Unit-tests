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

   private let networkClient: NetworkClientProviderProtocol
   private let pathProvider: PathProviderProtocol
   private let networkHeader: NetworkHeaderProvider
   private let networkParameters: NetworkParameterProvider
   
   let authManager: AuthTokenProviderProtocol
   
   init(networkClient: NetworkClientProviderProtocol,
        path: PathProviderProtocol,
        networkHeader: NetworkHeaderProvider,
        parameters: NetworkParameterProvider,
        authManager: AuthTokenProviderProtocol) {
       self.networkClient = networkClient
       self.pathProvider = path
       self.networkParameters = parameters
       self.networkHeader = networkHeader
       self.authManager = authManager
   }
}
extension NetworkService {
func makeExampleWorker() -> ExampleWorker {
            return ExampleWorker(networkClient: networkClient,
                                 pathProvider: pathProvider,
                                 networkParameters: networkParameters,
                                 networkHeader: networkHeader,
                                 authManager: authManager)
        }
}
