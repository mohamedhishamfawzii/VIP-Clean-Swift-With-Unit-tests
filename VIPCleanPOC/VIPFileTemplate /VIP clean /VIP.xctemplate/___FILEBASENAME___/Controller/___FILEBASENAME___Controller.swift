//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects
//

import Foundation

class ___VARIABLE_sceneName___Controller: ___VARIABLE_sceneName___ControllerProtocol {
    
    var interactor: ___VARIABLE_sceneName___InteractorProtocol
    var callback: ___VARIABLE_sceneName___ControllerCallback
    
    init(interactor: ___VARIABLE_sceneName___InteractorProtocol, callback: @escaping ___VARIABLE_sceneName___ControllerCallback) {
        self.interactor = interactor
        self.callback = callback
    }
    
    weak var view: ___VARIABLE_sceneName___ViewProtocol? {
        
        didSet {
            view?.callback = processViewCallback()
        }
    }
    
    func displayOnView(viewModel: ___VARIABLE_sceneName___ViewModelProtocol) {
        view?.display(viewModel: viewModel)
    }
}

private extension ___VARIABLE_sceneName___Controller {
    
    func processViewCallback() -> ___VARIABLE_sceneName___ViewCallback {
        
        return {[weak self] type in
            switch type {
            case .back:
                break
            }
        }
    }
}
