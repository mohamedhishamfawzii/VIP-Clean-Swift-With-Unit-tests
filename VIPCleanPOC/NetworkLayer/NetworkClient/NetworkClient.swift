////
////  NetworkClient+Execute.swift
////  NetworkLayerPOC
////
////  Created by Ramy Nasser on 17/11/2022.
////
//
import Alamofire
import Foundation

final class NetworkClient: NetworkClientProtocol {
    var authClientProvider: AuthTokenProviderProtocol?
    var errorProvider: ErrorProviderProtocol?
    internal lazy var session = Session()
    
    init (authProvider: AuthTokenProviderProtocol?,
          errorProvider: ErrorProviderProtocol?,
          session: Session = Session()) {
        self.session = session
        self.errorProvider = errorProvider
        self.authClientProvider = authProvider
    }
    
}
extension NetworkClient: NetworkResponseHandler {
    
}
