//
//  LogInViewController.swift
//  Navigation
//
//  Created by admin on 25.07.2021.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didEnterLogAndPass(login: String, password: String) -> Bool
    
}

class LogInViewController: UIViewController {
    
    private let router: ProfileRouter
    
    //делегат назначается в sceneDelegate
    weak var delegate: LoginViewControllerDelegate?
    
    let loginScreenView = LoginScreenView()
    
    init(router: ProfileRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        self.router.presenter = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        view.addSubview(loginScreenView)
        loginScreenView.myController = self
        loginScreenView.setupLoginScreenView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginScreenView.contentInset.bottom = keyboardSize.height
            loginScreenView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        loginScreenView.contentInset.bottom = .zero
        loginScreenView.verticalScrollIndicatorInsets = .zero
    }
    
}

//MARK: расширение для реализации работы CustomButton
extension LogInViewController: Tappable {
    
    func didTapLogInButton() -> Void? {
        #if DEBUG
        let testUser = TestUserService()
        let newVC = ProfileViewController(currentUser: testUser, named: "TTT")
        return navigationController?.pushViewController(newVC, animated: true)
        
        #else
        let user = User(name: "Эдвард-Руки-Ножницы", avatarImage: UIImage(named: "sergejzverev_27")!, statusText: "AAA")
        let currentUser = CurrentUserServise(user: user)
        
        let newVC = ProfileViewController(currentUser: currentUser, named: loginScreenView.loginTextField.text ?? "DDD")
        return navigationController?.pushViewController(newVC, animated: true)
        #endif
    }
    
}

