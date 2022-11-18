//
//  NetworkClient.swift
//  NetworkLayerPOC
//
//  Created by Ahmed Ramzy on 15/11/2022.
//

import Alamofire
import Foundation

extension NetworkClient {
    func executeData<T>(endpoint: Endpoint,
                        _ expectedModel: T.Type,
                        completion: CallResponse<T>) where T : Decodable, T : Encodable {
        let urlRequest = NetworkReqeustFactory.generateRequest(outOf: endpoint)
        session.request(urlRequest).responseData { response in
            self.handleResponse(endpoint, response, expectedModel, completion: completion)
        }
    }
}
