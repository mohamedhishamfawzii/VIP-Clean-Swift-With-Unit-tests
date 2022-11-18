//
//  handleError.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
import Alamofire
extension NetworkResponseHandler {
   
    func handleError<T>(_ error:Error, _ response: AFDataResponse<Data>, completion: CallResponse<T>) {
        guard let statusCode = response.response?.statusCode else {
            let error = SDKError(with: .timeout)
            errorProvider?.generalError.handle(sdkError: error)
            return
        }
        let errorType = KlivvrNetworkError(statusCode: statusCode)
        let errorModel = SDKError(with: errorType)
        
        switch errorType {
        // waf error
        case .general(statusCode: KlivvrNetworkError.Code.waf):
            handleWafError(statusCode: statusCode, response)
        // user error: an expected error occurs based on the user action
        case .general(statusCode: KlivvrNetworkError.Code.userError):
            handleAppError(statusCode: statusCode, response, completion: completion)
        // validation error: should rarely be in runtime, i.e. they will mostly be facing the developer not the user
        case .general(statusCode: KlivvrNetworkError.Code.validationError):
            handleValidationError(statusCode: statusCode, response, completion: completion)
        // general error
        case .unauthorized, .timeout:
            handleGeneralError(errorModel: errorModel)
        // general error
        default:
            completion?(NetworkResponse<T>.failure(errorModel))
        }
           
    }
    
    private func handleWafError(statusCode:Int, _ response: AFDataResponse<Data>) {
        guard let data = response.data else {
            return
        }
        do {
            let errorData = try JSONDecoder().decode(WAFErrorDTO.self, from: data)
            errorProvider?.wafError.handle(wafError: errorData)
        } catch {
            let wafError = WAFErrorDTO(status: "\(statusCode)", message: "", referenceID: "")
            errorProvider?.wafError.handle(wafError: wafError)
        }
    }
    
    private func handleGeneralError(errorModel: SDKError) {
        errorProvider?.generalError.handle(sdkError: errorModel)
    }
    
    private func handleAppError<T>(statusCode: Int, _ response: AFDataResponse<Data>, completion: CallResponse<T>) {
        guard let data = response.data else {
            let errorType = KlivvrNetworkError(statusCode: statusCode)
            let errorModel = SDKError(with: errorType)
            completion?(NetworkResponse<T>.failure(errorModel))
            return
        }
        do {
            let errorData = try JSONDecoder().decode(ErrorDto.self, from: data)
            let errorModel = SDKError(with: .userError(error: errorData))
            completion?(NetworkResponse<T>.failure(errorModel))
        } catch {
            let errorType: KlivvrNetworkError = .general(statusCode: statusCode)
            let errorModel = SDKError(with: errorType)
            completion?(NetworkResponse<T>.failure(errorModel))
        }
    }
    
    private func handleValidationError<T>(statusCode: Int, _ response: AFDataResponse<Data>, completion: CallResponse<T>) {
        guard let data = response.data else {
            let errorType = KlivvrNetworkError(statusCode: statusCode)
            let errorModel = SDKError(with: errorType)
            completion?(NetworkResponse<T>.failure(errorModel))
            return
        }
        do {
            let errorData = try JSONDecoder().decode(ValidationErrorDto.self, from: data)
            let errorModel = SDKError(with: .validationError(error: errorData))
            completion?(NetworkResponse<T>.failure(errorModel))
        } catch {
            let errorType: KlivvrNetworkError = .general(statusCode: statusCode)
            let errorModel = SDKError(with: errorType)
            completion?(NetworkResponse<T>.failure(errorModel))
        }
    }
}
