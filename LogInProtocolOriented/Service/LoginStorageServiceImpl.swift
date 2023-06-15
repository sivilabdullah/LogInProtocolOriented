//
//  LoginStorageServiceImpl.swift
//  LogInProtocolOriented
//
//  Created by abdullah's Ventura on 17.06.2023.
//

import Foundation

class LoginStorageServiceImpl : loginService{
   
    private let storage = UserDefaults.standard
    var setUserAccessToken: String{
        return "ACCESS_TOKEN"
    }
    //kayit
    func setUserAcessToken(token: String) {
        storage.set(token, forKey: setUserAccessToken)
    }
    //getirme
    func getUserAcessToken() -> String? {
        return storage.string(forKey: setUserAccessToken)
    }
    
    
}
