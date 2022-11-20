//
//  Endpoint.swift
//  NetworkLayerPOC
//
//  Created by Ahmed Ramzy on 15/11/2022.
//

import Foundation
enum EndpointType {
    case server
    case sandbox
    case localFile(bundle: Bundle, fileName: String)
}
protocol Endpoint {
    var url: URL { get }
    var headers: NetworkHTTPHeaders { get }
    var parameters: NetworkHTTPParameters? { get }
    var authorizationType: AuthorizationTypes { get }
    var method: NetworkHTTPMethod { get }
    var parameterEncoding: ParameterEncoding { get }
    var type: EndpointType { get }
    var timeoutInterval: TimeInterval { get }
}
