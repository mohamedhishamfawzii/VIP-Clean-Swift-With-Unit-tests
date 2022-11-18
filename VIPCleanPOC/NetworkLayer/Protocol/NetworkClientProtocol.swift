//
//  NetworkClientProtocol.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
protocol NetworkClientProtocol: AnyObject {
    func executeData<T: Codable>(endpoint: Endpoint, _ expectedModel: T.Type , completion: CallResponse<T>)
    func cancelTasks()
}

