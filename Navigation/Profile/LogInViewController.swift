//
//  LogInViewController.swift
//  Navigation
//
//  Created by admin on 25.07.2021.
//

import Foundation
import UIKit

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

class LogInViewController: UIViewController {
    
    let vkLogoImageView: UIImageView = {
        let vkLogoImageView = UIImageView ()
        
        vkLogoImageView.backgroundColor = .systemRed
        vkLogoImageView.image = #imageLiteral(resourceName: "logo")
        vkLogoImageView.translatesAutoresizingMaskIntoConstraints = false

        return vkLogoImageView
    }()
    
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone"
        return loginTextField
    }()
    
    let passTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.placeholder = "Password"
        passTextField.isSecureTextEntry = true
        return passTextField
    }()
    
    let entranceStackView: UIStackView = {
        let entranceStackView = UIStackView()
        entranceStackView.backgroundColor = .lightGray
        entranceStackView.spacing = 0.5
        entranceStackView.translatesAutoresizingMaskIntoConstraints = false
        return entranceStackView
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.textColor = .white
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .regular)
        loginButton.alpha = 1
        
        return loginButton
    }()
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        scrollView.backgroundColor = .green
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .onDrag
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        entranceStackView.addArrangedSubview(loginTextField)
        entranceStackView.addArrangedSubview(passTextField)
        scrollView.addSubview(containerView)
        containerView.addSubview(vkLogoImageView)
        containerView.addSubview(entranceStackView)
        containerView.addSubview(loginButton)
        
        view.addSubview(scrollView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(scrollView.contentSize)
    }
    
    override func viewWillLayoutSubviews() {
        vkLogoImageView.backgroundColor = view.backgroundColor
        entranceStackView.layer.borderColor = UIColor.lightGray.cgColor
        entranceStackView.layer.borderWidth = 0.5
        entranceStackView.layer.cornerRadius = 10
        entranceStackView.axis = .vertical
        entranceStackView.clipsToBounds = true
        entranceStackView.distribution = .fillEqually
        setupEntranceTextField(textField: loginTextField)
        setupEntranceTextField(textField: passTextField)
        
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            vkLogoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            vkLogoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            vkLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            vkLogoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            entranceStackView.topAnchor.constraint(equalTo: vkLogoImageView.bottomAnchor, constant: 120),
            entranceStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            entranceStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            entranceStackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.topAnchor.constraint(equalTo: entranceStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: entranceStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: entranceStackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
 
        ])
    }
    
    
    @objc func loginAction() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let newViewController = storyboard.instantiateViewController(withIdentifier: "ProfileID") as? ProfileViewController {
//            newViewController.modalTransitionStyle = .crossDissolve // это значение можно менять для разных видов анимации появления
//            newViewController.modalPresentationStyle = .overCurrentContext // это та самая волшебная строка, убрав или закомментировав ее, вы получите появление смахиваемого контроллера
            present(newViewController, animated: false, completion: nil)
           }
    }
    
    private func setupEntranceTextField(textField: UITextField) {
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.indent(size: 16)
    }
    
}

