//
//  PathProvider.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation
typealias Endpoint = String

fileprivate struct Endpoints {
    static let login: Endpoint = ""
}


class PathProvider: PathProviderProtocol {
    private let environment: EnvironmentProvider
    
    init(environmentProvider: EnvironmentProvider) {
        self.environment = environmentProvider
    }
    
    func createURL(type: NetworkAction) -> URL? {
        switch type {
        case .login:
            return URL(string: "google.com")
        }
    }
}

protocol PathProviderProtocol {
        func createURL(type: NetworkAction) -> URL?
}
private extension PathProvider {
        typealias QueryItem = (name: String, value: String?)
        
        func toURL(_ endpoint: Endpoint) -> URL? {
            return environment.baseURL.appendingPathComponent(endpoint)
        }
        
        func toURL(_ mainPath: Endpoint, query: QueryItem) -> URL? {
            var _endpoint: Endpoint = mainPath
            
            if let _queryValue = query.value {
                _endpoint = _endpoint + "/" + _queryValue + query.name
            } else {
                _endpoint = _endpoint + query.name
            }
            return environment.baseURL.appendingPathComponent(_endpoint)
        }
    }
