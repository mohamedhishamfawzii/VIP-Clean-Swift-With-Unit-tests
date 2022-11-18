//
//  NetworkResponseHandler.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
import Alamofire
protocol NetworkResponseHandler {
    var authClientProvider: AuthTokenProviderProtocol? { get set }
    var errorProvider: ErrorProviderProtocol? { get set }
    func handleResponse<T: Codable>(_ endpoint: Endpoint,
                                    _ response: AFDataResponse<Data>,
                                    _ expectedModel: T.Type,
                                    completion: CallResponse<T>)
}
