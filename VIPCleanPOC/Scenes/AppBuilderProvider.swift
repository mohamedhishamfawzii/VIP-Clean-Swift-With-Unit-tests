//
//  AppBuilderProvider.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 14/11/2022.
//

import UIKit

class AppBuilderProvider {
    func forceProvide() -> AppBuilder {
        guard let delegate = UIApplication.shared.delegate as? AppBuilder else {
            fatalError("What are you do with App Delegate?!")
        }
        return delegate
    }
}
