//
//  AuthTokenProvider.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
public typealias Success = (String?, Error?) -> Void
/// A protocol which is used by the network layer to use the authentication token when needed.
public protocol AuthTokenProviderProtocol {
    /// A method used to request authentication token.
    func requestAuthToken(closure: @escaping Success)
}
