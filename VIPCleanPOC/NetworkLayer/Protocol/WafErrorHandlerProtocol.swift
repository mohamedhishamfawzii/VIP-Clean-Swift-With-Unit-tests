//
//  WaFlErrorProtocol.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
public protocol WafErrorHandlerProtocol {
    func handle(wafError: WAFErrorDTO)
}

