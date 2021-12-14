//
//  SceneDelegate.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        //MARK: инициализация LoginInspector
        
//        let loginInspector = LoginInspector()
        
        //MARK: инициализация Factory для задачи 2
        
        let myInspectorFactory = InspectorFactory()
        
        if let tabController = window?.rootViewController as? UITabBarController,
           let loginNavigation = tabController.viewControllers?.last as? UINavigationController,
           let loginController = loginNavigation.viewControllers.first as? LogInViewController {
            
//               loginController.delegate = loginInspector
            
            let loginInspector = myInspectorFactory.makeLoginIncpector()
            loginController.delegate = loginInspector
            
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

