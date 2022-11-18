//
//  NetworkResponseHandler.swift
//  NetworkLayerPOC
//
//  Created by Ahmed Ramzy on 15/11/2022.
//

import Alamofire
import Foundation

public typealias CallResponse<T> = ((NetworkResponse<T>) -> Void)?

public enum NetworkResponse<T> {
    case success(T?), failure(SDKError)
}

extension NetworkResponseHandler {
    func handleResponse<T: Codable>(_ endpoint: Endpoint, _ response: AFDataResponse<Data>, _ expectedModel: T.Type, completion: CallResponse<T>) {
        switch endpoint.type {
        case .server:
            getResponseFromServer(response, expectedModel, completion: completion)
        case .localFile(let bundle, let fileName):
            let responseModel: T? = getData(bundle: bundle, fileName: fileName)
            completion?(NetworkResponse<T>.success(responseModel))
        case .sandbox:
            return
        }
    }
    
    private func getResponseFromServer<T: Codable>(_ response: AFDataResponse<Data>, _ expectedModel: T.Type, completion: CallResponse<T>) {
        switch response.result {
        case let .success(data):
            do {
                let responseModel = try JSONDecoder().decode(expectedModel.self, from: data)
                completion?(NetworkResponse<T>.success(responseModel))
            } catch _ {
                let encodingFailure = SDKError(with: .encodingFailed)
                completion?(NetworkResponse<T>.failure(encodingFailure))
            }
        case .failure(let error):
            handleError(error, response, completion: completion)
        }
    }
    
    private func getData<T: Codable>(bundle: Bundle, fileName: String, withExtension: String = "json") -> T? {
        let fileUrl = bundle.url(forResource: fileName, withExtension: withExtension)
        let data = try? Data(contentsOf: fileUrl!)
        do {
            let response = try JSONDecoder().decode(T.self, from: data!)
            return response
        } catch {
            return nil
        }
    }

}
