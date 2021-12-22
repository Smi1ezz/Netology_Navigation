//
//  MenuTabBarController.swift
//  Navigation
//
//  Created by admin on 16.12.2021.
//

import UIKit

class MenuTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(named: "Tab&NaviBarColor")
        setupTabBar()

    }
    
    func setupTabBar() {
        
        self.viewControllers = [
            UINavigationController(rootViewController: FeedVCFactory.instance.makeVC()),
            UINavigationController(rootViewController: ProfileVCFactory.instance.makeVC())
        ]
        setViewControllers(viewControllers, animated: true)

        setupTabBarItem(tabBarItem: viewControllers![0].tabBarItem,
                        image: UIImage(systemName: "list.bullet.rectangle.portrait"),
                        title: nil,
                        tintColor: .yellow)

        setupTabBarItem(tabBarItem: viewControllers![1].tabBarItem,
                        image: UIImage(systemName: "person.fill"),
                        title: nil,
                        tintColor: .yellow)

        self.selectedIndex = 0
    }
    
    func setupTabBarItem(tabBarItem: UITabBarItem, image: UIImage?, title: String?, tintColor: UIColor) {
        tabBarItem.image = image
        tabBarItem.title = title
        tabBarItem.image?.withTintColor(tintColor)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
