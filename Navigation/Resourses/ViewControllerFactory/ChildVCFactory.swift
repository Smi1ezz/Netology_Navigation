//
//  ChildVCFactory.swift
//  Navigation
//
//  Created by admin on 17.12.2021.
//

import Foundation
import UIKit

protocol VCFactoryProtocol {
    func makeVC() -> UIViewController
}

class FeedVCFactory: VCFactoryProtocol {
    
    static let instance = FeedVCFactory()
    
    func makeVC() -> UIViewController {
        let childVC = FeedViewController(router: FeedRouter())
        return childVC
    }
}

class ProfileVCFactory: VCFactoryProtocol {

    static let instance = ProfileVCFactory()
    
    func makeVC() -> UIViewController {
        let childVC = LogInViewController(router: ProfileRouter())
        return childVC
    }
}

