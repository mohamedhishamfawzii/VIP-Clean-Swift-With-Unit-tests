//
//  BaseCoordinatorProtocol.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 10/11/2022.
//

import Foundation

public protocol BaseCoordinatorProtocol: AnyObject {
    var dependencies: Array<BaseCoordinatorProtocol> { set get }
}
