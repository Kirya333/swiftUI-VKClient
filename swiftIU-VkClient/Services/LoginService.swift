//
//  LoginService.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import Foundation

class LoginService {
    let correctLogin = "Foo"
    let correctPassword = "bar"
    
    func checkUserData(login: String, password: String) -> Bool {
        if login == correctLogin && password == correctPassword {
            return true
        } else {
            return false
        }
    }
}
