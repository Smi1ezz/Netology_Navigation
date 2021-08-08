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
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(vkLogoImageView)
        view.addSubview(entranceStackView)
        view.addSubview(loginButton)
        entranceStackView.addArrangedSubview(loginTextField)
        entranceStackView.addArrangedSubview(passTextField)
        
        vkLogoImageView.backgroundColor = view.backgroundColor
        NSLayoutConstraint.activate([
            vkLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vkLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            vkLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            vkLogoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        entranceStackView.layer.borderColor = UIColor.lightGray.cgColor
        entranceStackView.layer.borderWidth = 0.5
        entranceStackView.layer.cornerRadius = 10
        entranceStackView.axis = .vertical
        entranceStackView.clipsToBounds = true
        entranceStackView.distribution = .fillEqually
        setupEntranceTextField(textField: loginTextField)
        setupEntranceTextField(textField: passTextField)
        
        NSLayoutConstraint.activate([
            entranceStackView.topAnchor.constraint(equalTo: vkLogoImageView.bottomAnchor, constant: 120),
            entranceStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            entranceStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            entranceStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: entranceStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: entranceStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: entranceStackView.trailingAnchor)
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
    
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    
}

