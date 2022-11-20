//
//  DataStorageKeys.swift
//  sdkfinance
//
//  Created by Ahmed Ramzy on 20/02/2022.
//  Copyright © 2022 Techfin, UAB
//  Address: Didžioji g. 14-1, LT-01128 Vilnius, Lithuania
//  mailto: info AT sdk dot finance
//  This file is part of the SDK.finance product. SDK.finance is the proprietary licensed software.
//  Unauthorised copying of this file, via any medium, modification and/or any ype of its distribution is strictly prohibited
//  Proprietary and confidential. All rights reserved.
//

import Foundation

open class DataStorageKeys {}

public final class DataStorageKey<T>: DataStorageKeys {
    let value: String
    let storageType: DataStorageManager.SupportedStorage

    init(_ value: String, storageType: DataStorageManager.SupportedStorage) {
        self.value = value
        self.storageType = storageType
    }
}

public extension DataStorageKeys {
    static let hasRunBefore = DataStorageKey<Bool?>(KlivvrKeys.hasRunBefore, storageType: .keychain)
    static let accessToken = DataStorageKey<String?>(KlivvrKeys.accessToken, storageType: .keychain)
    static let refreshToken = DataStorageKey<String?>(KlivvrKeys.refreshToken, storageType: .keychain)

}
