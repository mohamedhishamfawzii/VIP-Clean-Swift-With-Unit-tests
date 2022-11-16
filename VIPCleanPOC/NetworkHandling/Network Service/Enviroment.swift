//
//  Enviroment.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation

protocol EnvironmentProvider: AnyObject {
    var baseURL: URL { get }
}

enum EnvironmentType {
    case dev
    case staging
    case preprod
    case prod
}

class Environment: EnvironmentProvider {
    private let type: EnvironmentType
    init(type: EnvironmentType) {
        self.type = type
    }
    var baseURL: URL {
        var stringURL = "google.com"
        
        switch type {
        case .dev: stringURL = "dev"
        case .staging:  stringURL = "staging"
        case .preprod:  stringURL = "preprod"
        case .prod:  stringURL = "production"
        }
        guard let url = URL(string: stringURL) else {
                fatalError("Can't create URL from base string")
        }
        return url
    }}
