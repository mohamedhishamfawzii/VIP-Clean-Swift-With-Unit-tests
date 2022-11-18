//
//  NetworkClient+Cancel.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Alamofire
import Foundation

extension NetworkClient {
    func cancelTasks() {
        Alamofire.Session.default.session.getTasksWithCompletionHandler({ dataTasks, _, _ in
            dataTasks.forEach { $0.cancel() }
        })
    }
}
