//
//  NetworkClient.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import Foundation
import Alamofire

class NetworkClientProvider:NetworkClientProviderProtocol {

    
    let provider = NetworkClientBuilder.build()
    func request<T:Codable>(url: URL,
                            httpMethod: NetworkHTTPMethod,
                            requestParameters: HTTPParameters?,
                            requestHeaders: NetworkHTTPHeaders?,
                            requestTimeout: TimeInterval?,
                            responseParsingClass:T.Type,
                            authType: AuthorizationTypes,
                            endPointType: EndpointType,
                            parameterEncoding: ParameterEncoding,
                            responseHandler: @escaping ((NetworkServiceResponse) -> ())) {
        
        let request = RequestEndpoint(url: url, headers: requestHeaders ?? [:], authorizationType: authType, method: httpMethod, parameterEncoding: parameterEncoding, type: endPointType, timeoutInterval: requestTimeout ?? 30)
//        provider?.executeData(endpoint: Jokes.random, T.self) { response in
//            switch response {
//            case .success(let value):
//                self.view.makeToast("😂 \(value?.value) 😂")
//            case .failure(let sdkError):
//                self.view.hideToastActivity()
//                self.view.makeToast("serviceError: \(sdkError.error.debugDescription)")
//            }
//        }
     
    }
    
    func upload<T:Codable>(files: [Data],
                           url: URL,
                           httpMethod: NetworkHTTPMethod,
                           responseParsingClass:T.Type,
                           authType: AuthorizationTypes,
                           responseHandler: @escaping (NetworkServiceResponse) -> Void) {
        
    }
    
    
}

struct RequestEndpoint:Endpoint{
    var url: URL
    var headers: NetworkHTTPHeaders
    var parameters: NetworkHTTPParameters?
    var authorizationType: AuthorizationTypes
    var method: NetworkHTTPMethod
    var parameterEncoding: ParameterEncoding
    var type: EndpointType
    var timeoutInterval: TimeInterval
    

}
