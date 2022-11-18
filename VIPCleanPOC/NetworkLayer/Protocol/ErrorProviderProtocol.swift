//
//  ErrorProvider.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
/// A protocol which is used by the network layer to handle the error
public protocol ErrorProviderProtocol {
    /// protocol to handle general error from app side .
    var generalError: GeneralErrorHandlerProtocol {get set}
    // protocol to handle waf error from app side .
    var wafError: WafErrorHandlerProtocol {get set}
}
