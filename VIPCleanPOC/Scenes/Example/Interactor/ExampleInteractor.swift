//
//  ExampleInteractor.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 10/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects
//

import UIKit

class ExampleInteractor: ExampleInteractorProtocol {
    //MARK: Dependencies
    weak var presenter: ExamplePresenterProtocol?
    private let exampleWorker = AppBuilderProvider().forceProvide().networkService.exampleWorker
    
    func fetchUser(with mobile:String) {
        //intialize the network call using the network client and when the response is returned the interactor delegates it to the presenter
        // calling network 🌐.........
        // reponse returned ⬅️
        let result = ServerResponseUserData(username: "Hisham@",
                                            email: "m.hisham@live.com",
                                            balance: "2,000")
        exampleWorker.exampleRequest{ [weak self] (result) in
            switch result {
            case .success(_):
                print("Success")
            case .failure(_):
                print("Failure")
            }
            
        }
        self.presenter?.processSuccess(result: result)
    }
    
}


//example server response
struct ServerResponseUserData {
    let username: String
    let email: String
    let balance: String
}
