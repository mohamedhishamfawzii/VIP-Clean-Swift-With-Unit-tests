//
//  File.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 15/11/2022.
//

import Foundation
protocol NetworkParameterProvider {
    func networkParameters(_ type: NetworkAction) -> HTTPParameters?
}
typealias HTTPParameters = [String: AnyHashable]
typealias HTTPHeaders = [String: String]


class NetworkParameter: NetworkParameterProvider {
    
    func networkParameters(_ type: NetworkAction) -> HTTPParameters? {
        
        switch type {
        case .login:
            return [:]
        }
    }}

private extension NetworkParameter {
    func createNetworkParams<T: Codable>(from model: T) -> HTTPParameters? {
        guard let dataObject = try? JSONEncoder().encode(model) else {
            return nil
        }
        guard let mapObject = try? JSONSerialization.jsonObject(with: dataObject) as? HTTPParameters else {
            return nil
        }
        
        return mapObject
    }
    
}

extension Encodable {
     var dictionary: [String: Any]? {
       guard let data = try? JSONEncoder().encode(self) else { return nil }
       return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
     }
}
