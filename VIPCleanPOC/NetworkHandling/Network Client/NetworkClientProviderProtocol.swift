//
//  NetworkClientProtocol.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation
protocol NetworkClientProviderProtocol {
    
    func request<T:Codable>(url: URL,
                 httpMethod: NetworkHTTPMethod,
                 requestParameters: NetworkHTTPParameters?,
                 requestHeaders: NetworkHTTPHeaders?,
                 requestTimeout: TimeInterval?,
                 responseParsingClass:T.Type,
                 authType: AuthorizationTypes,
                 endPointType: EndpointType,
                 parameterEncoding: ParameterEncoding,
                 responseHandler: @escaping ((NetworkServiceResponse) -> ()))
    
    func upload<T:Codable>(files: [Data],
                url: URL,
                httpMethod: NetworkHTTPMethod,
                responseParsingClass:T.Type,
                authType: AuthorizationTypes,
                responseHandler: @escaping (NetworkServiceResponse) -> Void)
}
