//
//  Checker.swift
//  Navigation
//
//  Created by admin on 14.12.2021.
//

import Foundation

protocol CheckProtocol {
    func check(login: String, password: String) -> Bool
}

class CheckerModel: CheckProtocol {
    
    static let instance = CheckerModel.init(login: "Edward-Scissor-Hands", password: "StrongPassword")
    
    private let login: String
    private let pswd: String
    private let passToSeeImportantPost = "Пароль"
    
    private init(login: String, password: String) {
        self.login = login
        self.pswd = password
    }
    
    func check(word: String) -> Bool {
        if word == passToSeeImportantPost {
            return true
        }
        return false
    }
    
    func check(login: String, password: String) -> Bool {
        if login == self.login && password == self.pswd {
            return true
        } else {
            return false
        }
    }
}


