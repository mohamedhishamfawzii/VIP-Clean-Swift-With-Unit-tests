//
//  NetworkAction.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation
protocol NetworkAction {
    var path: String {get}
    var parameters: [String: String] {get}
}
enum LoginNetworkAction: NetworkAction{
    case login
    var path: String {
        switch self {
        case .login:
            return "/login"
        }
    }
    var parameters: [String: String] {
        switch self {
        case .login:
            return [:]
        }
    }
}
