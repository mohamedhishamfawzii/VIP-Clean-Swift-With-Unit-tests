//
//  UserDefaultsStorage.swift
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

final class UserDefaultsStorage {
    public static let shared = UserDefaultsStorage()

    let defaults: UserDefaults = UserDefaults.standard
}

extension UserDefaultsStorage: WritableStorage {
    func save<T>(value: T?, for key: DataStorageKey<T?>) where T: Cachable {
        if let encodedValue = try? JSONEncoder().encode(value) {
            defaults.set(encodedValue, forKey: key.value)
        }
    }

    func remove<T>(for key: DataStorageKey<T?>) where T: Cachable {
        defaults.removeObject(forKey: key.value)
    }
}

extension UserDefaultsStorage: ReadableStorage {
    func fetchValue<T>(for key: DataStorageKey<T?>) -> T? where T: Cachable {
        guard let data = defaults.object(forKey: key.value) as? Data,
              let value = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return value
    }
}
