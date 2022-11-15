//
//  NetworkServiceProtocol.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation

protocol NetworkServiceProtocol {
    var authManager: AuthManagerProtocol { get }
    var exampleWorker: ExampleWorkerProtocol { get }
}
