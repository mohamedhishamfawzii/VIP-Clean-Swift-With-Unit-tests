//
//  ErrorProvider.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 18/11/2022.
//

import Foundation

struct AppErrorProvider: ErrorProviderProtocol {
    var wafError: WafErrorHandlerProtocol
    var generalError: GeneralErrorHandlerProtocol
}

struct GeneralErrorHandler: GeneralErrorHandlerProtocol {
    func handle(sdkError: SDKError) {
     
    }
}
struct WafErrorHandler: WafErrorHandlerProtocol {
    func handle(wafError: WAFErrorDTO) {
    
    }
}
