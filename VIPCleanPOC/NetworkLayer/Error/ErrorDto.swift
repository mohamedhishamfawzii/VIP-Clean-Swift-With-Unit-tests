//
//  ErrorDto.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation

/// provides error entity for requests
public class ErrorDto: Codable {
    /** Value of error code */
    public var code: String?

    init(code: String?) {
        self.code = code
    }
    
    private enum CodingKeys: String, CodingKey {
        case code
    }

    // Encodable protocol methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
    }

    // Decodable protocol methods
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code)
    }
}
