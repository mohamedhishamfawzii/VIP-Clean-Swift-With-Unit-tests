//
//  WAFErrorDTO.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation

public class WAFErrorDTO: Codable {
    let status: String?
    let message: String?
    let referenceID: String?

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case referenceID = "reference ID"
    }

    init(status: String?, message: String?, referenceID: String?) {
        self.status = status
        self.message = message
        self.referenceID = referenceID
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(referenceID, forKey: .referenceID)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        status = try container.decodeIfPresent(String.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        referenceID = try container.decodeIfPresent(String.self, forKey: .referenceID)
    }
}
