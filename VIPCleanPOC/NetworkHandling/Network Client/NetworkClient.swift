//
//  NetworkClient.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation

class NetworkClient:NetworkClientProtocol {
    func request(url: URL,
                 httpMethod: NetworkHTTPMethod,
                 encoding: Encoding,
                 requestParameters: HTTPParameters?,
                 requestHeaders: NetworkHTTPHeaders?,
                 requestTimeout: TimeInterval?,
                 responseHandler: @escaping ((NetworkServiceResponse) -> ())) {
    
        
    }
    
    func upload(files: [Data],
                url: URL,
                httpMethod: NetworkHTTPMethod,
                requestHeaders: NetworkHTTPHeaders?,
                responseHandler: @escaping (NetworkServiceResponse) -> Void) {
        
    }
    
    
}