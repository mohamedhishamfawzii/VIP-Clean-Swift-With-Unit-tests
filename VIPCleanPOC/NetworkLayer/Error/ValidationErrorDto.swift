//
//  ValidationErrorDto.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
import Foundation

// MARK: - Welcome
public struct ValidationErrorDto: Codable {
    let issues: [ValidationIssueDto]
}

// MARK: - Issue
public struct ValidationIssueDto: Codable {
    let code, expected, received: String?
    let path: [String]
    let message: String?
}
