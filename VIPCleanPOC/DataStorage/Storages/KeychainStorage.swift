//
//  KeychainStorage.swift
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
import KeychainSwift

final class KeychainStorage {
    public static let shared = KeychainStorage()

    private let keychain = KeychainSwift()
}

extension KeychainStorage: WritableStorage {
    public func remove<T>(for key: DataStorageKey<T?>)  {
        keychain.delete(key.value)
    }

    public func save<T: Cachable>(value: T?, for key: DataStorageKey<T?>) {
        if let encodedValue = try? JSONEncoder().encode(value) {
            keychain.set(encodedValue, forKey: key.value)
        }
    }
}

extension KeychainStorage: ReadableStorage {
    public func fetchValue<T: Cachable>(for key: DataStorageKey<T?>) -> T? {
        guard let data = keychain.getData(key.value),
              let value = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return value
    }
}
