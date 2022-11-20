//
//  ExampleWorker.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 15/11/2022.
//

import Foundation

typealias ExampleRequestCompletion = ((Result<String, ExampleRequestError>)->())
enum ExampleRequestError:Error {
    case URLError
    case error
}
class ExampleWorker:BaseWorker,ExampleWorkerProtocol {
    func exampleRequest(completion:@escaping ExampleRequestCompletion){
        guard let url = pathProvider.createURL(type: LoginNetworkAction.login) else {
            completion(.failure(.URLError))
            return
        }
        let parameters = requestParameters.networkParameters(LoginNetworkAction.login)
        
        networkClient.request(url: url,
                              httpMethod: .get,
                              requestParameters: parameters ,
                              requestHeaders: nil,
                              requestTimeout: nil,
                              responseParsingClass: String.self,
                              authType: .none,
                              endPointType: .server,
                              parameterEncoding: .JSON) { [weak self] serverResponse in
            switch serverResponse {
            case .successData(let data):
                guard let _data = data else {
                    completion(.failure(.error))
                    return
                }
            case .errors(let error):
                completion(.failure(.error))
            }
        }
    }
}
