//
//  KlivrrError.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
/// reference https://klivvr.atlassian.net/wiki/spaces/TPC/pages/2086895854/Errors
public enum KlivvrNetworkError: Error {
    struct Code {
        static let badRequest = 400
        static let unauthorized = 401
        static let forbidden = 403
        static let validationError = 422
        static let urlNotFound = 404
        static let server = 500
        static let userError = 400
        static let preconditionRequired = 428
        static let malformedResponse = 999
        static let custom = 1000
        static let malformedData = 1001
        public static let waf = 511
        public static let timeout = 504
    }
    
    case urlNotFound
    case encodingFailed
    case forbidden
    case unauthorized
    case preconditionRequired
    case serverError
    case timeout
    case general(statusCode: Int)
    case validationError(error: ValidationErrorDto)
    case waf(error: WAFErrorDTO)
    case userError(error: ErrorDto)
        
    init(statusCode: Int) {
        switch statusCode {
        case Code.urlNotFound:
            self = .urlNotFound
        case Code.forbidden:
            self = .forbidden
        case Code.unauthorized:
            self = .unauthorized
        case Code.preconditionRequired:
            self = .preconditionRequired
        case Code.server:
            self = .serverError
        case Code.timeout:
            self = .timeout
        default: 
            self = .general(statusCode: statusCode)
        }
    }
}
/// provides custom error class for internal/external error handling
public class SDKError {
    var error: KlivvrNetworkError!
    public init(with error: KlivvrNetworkError) {
        self.error = error
    }
}
