//
//  ExampleControllerProtocol.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 10/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects
//

import Foundation

//💡 The callback type enum represents all the cases that the controller will wanna communicate to the next layer (coordinator) mainly navigation actions
enum ExampleControllerCallbackType {
    case close
    case back
    case navigateToChild
}

//💡 The callback is a closure with the callback type as an input to determine the navigation action that the controller wants to delegate to the coordinator
typealias ExampleControllerCallback = ((ExampleControllerCallbackType) -> ())


// MARK: Controller Protocol
protocol ExampleControllerProtocol: AnyObject {
    var interactor: ExampleInteractorProtocol { set get }
    var callback: ExampleControllerCallback { set get }
    var view: ExampleViewProtocol? { set get }
    func displayOnView(viewModel: ExampleViewModelProtocol)
}
