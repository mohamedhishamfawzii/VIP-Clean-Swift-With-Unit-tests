//
//  NetworkHTTPMethods.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation
enum NetworkHTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
enum Encoding: Int {
    case URL
    case JSON
    case queryString
}
typealias NetworkHTTPParameters = [String: AnyHashable]
typealias NetworkHTTPHeaders = [String: String]

enum NetworkServiceResponse {
    case successData(_ data: Codable?)
    case errors(ErrorsNetworkServiceType)
}

enum ErrorsNetworkServiceType: Error {
    case requestTimeout
    case authorizationFailed
}
