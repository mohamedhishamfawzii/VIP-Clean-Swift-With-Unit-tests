//
//  ExampleTests.swift
//  VIPCleanPOCTests
//
//  Created by Mohamed Hisham on 10/11/2022.
//

import XCTest
@testable import VIPCleanPOC

final class ExampleTests: XCTestCase {
    func testExample() throws {
        testFetchUserCallsPresenterToProccessResult()
        testDisplayFetchedUserCalledByPresenter()
        testDisplayViewCalledByController()
    }
}

//MARK: Seeds
struct Seeds {
    struct Users {
        static let hisham = ServerResponseUserData(username: "Hisham@",
                                                   email: "m.hisham@live.com",
                                                   balance: "2,000")
    }
}
//MARK: Spies
class InteractorSpy: ExampleInteractorProtocol {
    var presenter:ExamplePresenterProtocol?
    func fetchUser(with mobile: String) {
    }
    init(presenter:ExamplePresenterProtocol) {
        self.presenter = presenter
    }
}
class ControllerSpy: ExampleControllerProtocol {
    var interactor: ExampleInteractorProtocol
    var callback: ExampleControllerCallback
    var view: ExampleViewProtocol?
    var displayOnViewCalled = false
    var user: ExampleViewModelProtocol?
    func displayOnView(viewModel: ExampleViewModelProtocol) {
        displayOnViewCalled = true
        user = viewModel
    }
    init(view:ExampleViewProtocol, interactor:ExampleInteractorProtocol) {
        self.view = view
        self.callback = { _ in
        }
        self.interactor = interactor
    }
}
class PresenterSpy: ExamplePresenterProtocol {
    var controller: ExampleControllerProtocol?
    var presentSuccessCalled = false
    func processSuccess(result:ServerResponseUserData){
        presentSuccessCalled = true
    }
    init(controller:ExampleControllerProtocol) {
        self.controller = controller
    }
}
class ViewSpy: ExampleViewProtocol {
    var callback:ExampleViewCallback?
    var user: ExampleViewModelProtocol?
    func display(viewModel:ExampleViewModelProtocol) {
        user = viewModel
    }
}



//Test cases:
//MARK: Interactor tests
func testFetchUserCallsPresenterToProccessResult() {
    
    // Given
    //Tested entity
    let sut = ExampleInteractor()
    //Spies
    let viewSpy = ViewSpy()
    let controllerSpy = ControllerSpy(view: viewSpy, interactor: sut)
    let presenterSpy = PresenterSpy(controller: controllerSpy)
    sut.presenter = presenterSpy
    // When
    sut.fetchUser(with: "01001302801")
    // Then
    XCTAssert(presenterSpy.presentSuccessCalled,
     "fetchUser() should ask the presenter to process the user")
}

//MARK: Presenter tests
func testDisplayFetchedUserCalledByPresenter() {
    // Given
    //Tested entity
    let sut = ExamplePresenter()
    //Spies
    let viewSpy = ViewSpy()
    let interactorSpy = InteractorSpy(presenter: sut)
    let controllerSpy = ControllerSpy(view: viewSpy, interactor: interactorSpy)
    sut.controller = controllerSpy
    // When
    sut.processSuccess(result: Seeds.Users.hisham)
    // Then
    XCTAssert(controllerSpy.displayOnViewCalled,
     "processSuccess(reult) should ask the view controller to display on view")
    XCTAssertEqual(controllerSpy.user?.username, Seeds.Users.hisham.username)
}


//MARK: Controller tests
func testDisplayViewCalledByController() {
    // Given
    //Tested entity
    let sut = ExampleController(interactor: ExampleInteractor() , callback: {_ in })
    //Spies
    let viewSpy = ViewSpy()
    sut.view = viewSpy
    // When
    struct ViewModel: ExampleViewModelProtocol {
        var username: String
        var email: String
        var balance: String
    }
    sut.displayOnView(viewModel: ViewModel(username: "Hisham@", email: "m.hisham@live.com", balance: "2,000"))
    
    // Then
    XCTAssertEqual(viewSpy.user?.username, Seeds.Users.hisham.username)
}
