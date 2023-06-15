//
//  LogInProtocolOrientedTests.swift
//  LogInProtocolOrientedTests
//
//  Created by abdullah's Ventura on 15.06.2023.
//

import XCTest
@testable import LogInProtocolOriented

final class LogInProtocolOrientedTests: XCTestCase {

    private var viewModel : RootViewModel!
    
    private var loginService : MockingLoginService!
    private var outputRootViewModel : MockOutputRootViewModel!
    
    override func setUpWithError() throws {
        loginService = MockingLoginService()
        outputRootViewModel = MockOutputRootViewModel()
        viewModel = RootViewModel(loginStorageService: loginService)
        viewModel.output = outputRootViewModel
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginService = nil
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAcessToken() throws {
        loginService.storage = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(outputRootViewModel.checkArray.first, .login)
        
    }
    func testShowLogin_whenLoginStorageReturnsEmptySring() throws {
        loginService.storage["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        
        XCTAssertEqual(outputRootViewModel.checkArray.first, .login)
        
    }
    func testShowMainApp_whenLoginStorageReturnsUserAcessToken() throws {
        loginService.storage["ACCESS_TOKEN"] = "163546515648615"
        viewModel.checkLogin()
        
        XCTAssertEqual(outputRootViewModel.checkArray.first, .mainApp)
    }

}

    
class MockingLoginService : loginService{
    var setUserAccessToken: String{
        return "ACCESS_TOKEN"
    }
    var storage : [String:String] = [:]
    
    func setUserAcessToken(token: String) {
        storage[setUserAccessToken] = token
    }
    
    func getUserAcessToken() -> String? {
        return storage[setUserAccessToken]
    }
}

class MockOutputRootViewModel : OutputRootViewModel{
   
    enum Check {
        case login
        case mainApp
    }
    var checkArray : [Check] = []
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }
    
    func showLoginScreen() {
        checkArray.append(.login)
    }
    
    
}
