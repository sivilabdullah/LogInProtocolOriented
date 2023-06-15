//
//  Service.swift
//  LogInProtocolOriented
//
//  Created by abdullah's Ventura on 17.06.2023.
//

import Foundation

protocol loginService{
    var setUserAccessToken : String { get }
    func setUserAcessToken(token: String)
    func getUserAcessToken() -> String?
}
