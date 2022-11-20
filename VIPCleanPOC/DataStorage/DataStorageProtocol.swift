//
//  DataStorageProtocol.swift
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

public protocol Cachable: Codable { }

public protocol ReadableStorage {
  func fetchValue<T: Cachable>(for key: DataStorageKey<T?>) -> T?
}

public protocol WritableStorage {
  func save<T: Cachable>(value: T?, for key: DataStorageKey<T?>)
  func remove<T: Cachable>(for key: DataStorageKey<T?>)
}

public typealias Storage = ReadableStorage & WritableStorage

extension String: Cachable { }
extension Int: Cachable { }
extension Data: Cachable { }
extension Float: Cachable { }
extension Double: Cachable { }
extension Array: Cachable where Iterator.Element: Cachable { }
extension Date: Cachable { }
extension Bool: Cachable { }
