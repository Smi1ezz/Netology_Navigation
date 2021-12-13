//
//  UserModel.swift
//  Navigation
//
//  Created by admin on 13.12.2021.
//

import Foundation
import UIKit

protocol UserService {
    func checkUserName(name: String) throws -> User
}

enum UserServiseError: Error {
    case invalidName
    case invalidAvatar
    case invalidStatus
}

class User {
    var name: String
    var avatarImage: UIImage
    var statusText: String
    
    init(name: String, avatarImage: UIImage, statusText: String) {
        self.name = name
        self.avatarImage = avatarImage
        self.statusText = statusText
    }
    
    func tellName() -> String {
        return self.name
    }
}

class CurrentUserServise: UserService {
    private var currentUser: User
    
    init(user: User) {
        self.currentUser = user
    }
    
    func checkUserName(name: String) throws -> User {
        guard name == currentUser.name else {
            throw UserServiseError.invalidName
        }
        return currentUser
    }
    
    func changeUserTo(user: User) {
        currentUser = user
    }
}

class TestUserService: UserService {
    private let testUser = User(name: "Test Name", avatarImage: UIImage(named: "logo") ?? UIImage(systemName: "info")!, statusText: "Test Status")
    
    func checkUserName(name: String) throws -> User {
        print("Режим Debug. Введенные параметры изменены на тестовые")
        return testUser
    }
}
