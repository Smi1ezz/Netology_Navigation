//
//  SceneDelegate.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit
import iOSIntPackage
import StorageService

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {return}
        
        let window = UIWindow(windowScene: windowScene)

        window.backgroundColor = UIColor.white
        window.rootViewController = MenuTabBarController()
        window.makeKeyAndVisible()
        self.window = window
        
        //MARK: инициализация LoginInspector
        
//        let loginInspector = LoginInspector()
        
        //MARK: инициализация Factory для задачи 2
        
        let myInspectorFactory = InspectorFactory()
        
        if let login = window.rootViewController?.presentedViewController as? LogInViewController {
            
            let loginInspector = myInspectorFactory.makeLoginIncpector()
            login.delegate = loginInspector
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

