//
//  ExampleChildPresenter.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 10/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects
//

import UIKit

class ExampleChildPresenter: ExampleChildPresenterProtocol {
    
    struct ViewModel: ExampleChildViewModelProtocol {
        
    }
    
    var controller: ExampleChildControllerProtocol?
    
    func processViewLoaded() {
        
        controller?.displayOnView(viewModel: ViewModel())
    }
}
