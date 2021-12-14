//
//  File.swift
//  Navigation
//
//  Created by admin on 14.12.2021.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    
    private let inspector = CheckerService.instance
    
    func didEnterLogAndPass(login: String, password: String) -> Bool {
        guard inspector.check(login: login, password: password) == true else {return false}
        return true
    }
    
}
