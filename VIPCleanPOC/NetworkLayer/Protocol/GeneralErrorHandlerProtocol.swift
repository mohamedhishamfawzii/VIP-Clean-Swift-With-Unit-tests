//
//  GeneralErrorHandlerProtocol.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 18/11/2022.
//

import Foundation
public protocol GeneralErrorHandlerProtocol {
    func handle(sdkError: SDKError)
}
