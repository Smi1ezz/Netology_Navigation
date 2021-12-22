//
//  LoginScreenView.swift
//  Navigation
//
//  Created by admin on 20.12.2021.
//

import Foundation
import UIKit



final class LoginScreenView: UIScrollView {
    
    weak var myController: Tappable?
            
    private let containerView = UIView()
    
    private let vkLogoImageView: UIImageView = {
        let vkLogoImageView = UIImageView ()
        vkLogoImageView.image = UIImage(named: "logo")
        return vkLogoImageView
    }()

    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone"
        return loginTextField
    }()

    private let passTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.placeholder = "Password"
        passTextField.isSecureTextEntry = true
        return passTextField
    }()
    
    private let entranceStackView: UIStackView = {
        let entranceStackView = UIStackView()
        return entranceStackView
    }()
    
    
    //MARK: класс кнопки заменен на CustomButton для задания 6 - архитектура MVC
    private let myLoginButton: CustomButton = {
        let loginButton = CustomButton(title: "Log IN", tintColor: nil, action: nil)
        
        loginButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.titleLabel?.textColor = .white
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .regular)
        loginButton.alpha = 1
        
        return loginButton
        
    }()
    
    func setupLoginScreenView() {
        self.backgroundColor = .white
        
        loginTextField.delegate = self
        myLoginButton.butonTapped = myController?.didTapLogInButton

        entranceStackView.addArrangedSubview(loginTextField)
        entranceStackView.addArrangedSubview(passTextField)
        
        containerView.addSubview(vkLogoImageView)
        containerView.addSubview(entranceStackView)
        containerView.addSubview(myLoginButton)
        
        self.keyboardDismissMode = .onDrag
        
        self.addSubview(containerView)
        
        setupEntranceTextField(textField: loginTextField)
        setupEntranceTextField(textField: passTextField)
        setupStackView()
        setupConstraints()

    }
    
    private func setupStackView() {
        entranceStackView.backgroundColor = .lightGray
        entranceStackView.spacing = 0.5
        entranceStackView.layer.borderColor = UIColor.lightGray.cgColor
        entranceStackView.layer.borderWidth = 0.5
        entranceStackView.layer.cornerRadius = 10
        entranceStackView.axis = .vertical
        entranceStackView.clipsToBounds = true
        entranceStackView.distribution = .fillEqually
    }
    
    private func setupEntranceTextField(textField: UITextField) {
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.indent(size: 16)
    }
    
    private func setupConstraints() {
        let views = [self, containerView, vkLogoImageView, loginTextField, passTextField, entranceStackView, myLoginButton]
        
        for i in views {
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            //MARK: force unwrap in func
            self.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            vkLogoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            vkLogoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            vkLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            vkLogoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            entranceStackView.topAnchor.constraint(equalTo: vkLogoImageView.bottomAnchor, constant: 120),
            entranceStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            entranceStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            entranceStackView.heightAnchor.constraint(equalToConstant: 100),
            
            myLoginButton.topAnchor.constraint(equalTo: entranceStackView.bottomAnchor, constant: 16),
            myLoginButton.leadingAnchor.constraint(equalTo: entranceStackView.leadingAnchor),
            myLoginButton.trailingAnchor.constraint(equalTo: entranceStackView.trailingAnchor),
            myLoginButton.heightAnchor.constraint(equalToConstant: 50),
            myLoginButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
 
        ])
    }
}

//MARK: extension for UITextFieldDelegate
extension LoginScreenView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginTextField.text = textField.text
        resignFirstResponder()
        return true
    }
}
