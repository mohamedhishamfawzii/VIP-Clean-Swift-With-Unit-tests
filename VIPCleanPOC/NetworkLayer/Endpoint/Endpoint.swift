//
//  Endpoint.swift
//  NetworkLayerPOC
//
//  Created by Ahmed Ramzy on 15/11/2022.
//

import Foundation
import Alamofire
enum EndpointType {
    case server
    case sandbox
    case localFile(bundle: Bundle, fileName: String)
}
protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters? { get }
    var authorizationType: AuthorizationTypes { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var type: EndpointType { get }
    var timeoutInterval: TimeInterval { get }
}

extension Endpoint{
    var type: EndpointType {
        return .server
    }
    
    var timeoutInterval: TimeInterval {
        return 10
    }
    var headers: HTTPHeaders {
        return [:]
    }
    
}
