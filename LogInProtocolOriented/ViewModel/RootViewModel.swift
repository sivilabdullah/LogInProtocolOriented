//
//  RootViewModel.swift
//  LogInProtocolOriented
//
//  Created by abdullah's Ventura on 15.06.2023.
//

import Foundation
class RootViewModel{
    
    private let loginStorageService : loginService
    
    weak var output: OutputRootViewModel?
    
    init(loginStorageService: loginService) {
        self.loginStorageService = loginStorageService
      
    }
    
    func checkLogin(){
        if let accessToken = loginStorageService.getUserAcessToken(), !accessToken.isEmpty{
           // showMainApp()
            output?.showMainApp()
        }else{
          //  showLoginScreen()
            output?.showLoginScreen()
        }
    }
}
