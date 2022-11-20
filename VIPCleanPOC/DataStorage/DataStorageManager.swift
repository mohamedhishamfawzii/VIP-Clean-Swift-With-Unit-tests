//
//  DataStorageManager.swift
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
public class DataStorageManager {
    public static let shared = DataStorageManager()

    enum SupportedStorage {
        case userDefaults
        case keychain
    }

    private lazy var encryptedStorage = KeychainStorage.shared
    private lazy var userDefaultsStorage = UserDefaultsStorage.shared

    public func fetch<T: Cachable>(for key: DataStorageKey<T?>) -> T? {
        return getSuitableStorage(from: key.storageType).fetchValue(for: key)
    }

    public func save<T: Cachable>(_ value: T?, for key: DataStorageKey<T?>) {
        getSuitableStorage(from: key.storageType).save(value: value, for: key)
    }

    public func remove<T: Cachable>(for key: DataStorageKey<T?>) {
        getSuitableStorage(from: key.storageType).remove(for: key)
    }
}

private extension DataStorageManager {
    func getSuitableStorage(from choice: SupportedStorage) -> Storage {
        switch choice {
        case .keychain:
            return encryptedStorage
        case .userDefaults:
            return userDefaultsStorage
        }
    }
}
