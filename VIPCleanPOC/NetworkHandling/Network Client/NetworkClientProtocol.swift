//
//  NetworkClientProtocol.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation
protocol NetworkClientProtocol {
    
    func request<T:Codable>(url: URL,
                 httpMethod: NetworkHTTPMethod,
                 encoding: Encoding,
                 requestParameters: NetworkHTTPParameters?,
                 requestHeaders: NetworkHTTPHeaders?,
                 requestTimeout: TimeInterval?,
                 responseParsingClass:T.Type,
                 responseHandler: @escaping ((NetworkServiceResponse) -> ()))
    
    func upload<T:Codable>(files: [Data],
                url: URL,
                httpMethod: NetworkHTTPMethod,
                requestHeaders: NetworkHTTPHeaders?,
                responseParsingClass:T.Type,
                responseHandler: @escaping (NetworkServiceResponse) -> Void)
}
