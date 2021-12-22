//
//  FeedView.swift
//  Navigation
//
//  Created by admin on 16.12.2021.
//

import UIKit
import SnapKit

class FeedView: UIView {
    
    weak var myController: UIViewController?
    
    private let label: UILabel = {
       let label = UILabel()
        label.text = "Введите пароль"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Введите \"Пароль\""
        passwordTextField.backgroundColor = UIColor(named: "Tab&NaviBarColor")
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.indent(size: 4)
       return passwordTextField
    }()
    
    let checkPasswordButton: CustomButton = {
        let checkPasswordButton = CustomButton(title: "check", tintColor: .white, action: nil)
        checkPasswordButton.setTitle("", for: .normal)
        checkPasswordButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        checkPasswordButton.backgroundColor = UIColor(named: "ColorForPostButton")
        checkPasswordButton.layer.cornerRadius = 5
        return checkPasswordButton
    }()
    
    let firstButton: CustomButton = {
        let button = CustomButton(title: "tap to see importand post", tintColor: nil, action: nil)

        return button
    }()
    
    let secondButton: CustomButton = {
        let button = CustomButton(title: "tap to see very importand post", tintColor: nil, action: nil)

        return button
    }()
    
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        passwordTextField.delegate = self
        setButtonStyle(button: firstButton)
        setButtonStyle(button: secondButton)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        self.addSubview(label)
        self.addSubview(passwordTextField)
        self.addSubview(checkPasswordButton)
        self.addSubview(stackView)
        self.backgroundColor = .white
        setupConstraints()
    }
    
    func wrongPassMakeLabelRed() {
        label.textColor = .red
    }
    
    func isTextFieldEmpty() -> Bool {
        if passwordTextField.text == "" || passwordTextField.text == nil {
            return true
        } else {
            return false
        }
    }
    
    func textFromTextField() -> String? {
        var result: String? = nil
        if let safeTextFieldText = passwordTextField.text {
            if !safeTextFieldText.isEmpty {
                result = safeTextFieldText
            }
        }
        return result
    }
    
    func reloadTextFieldAndButtons() {
        firstButton.setTitleColor(.systemGray, for: .normal)
        firstButton.buttonTapped = nil
        secondButton.setTitleColor(.systemGray, for: .normal)
        secondButton.buttonTapped = nil
        passwordTextField.text = nil
    }
    
    private func setButtonStyle(button: UIButton) {
        button.backgroundColor = UIColor(named: "ColorForPostButton")
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        for i in [stackView, firstButton, secondButton, passwordTextField, checkPasswordButton, label] {
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.snp.makeConstraints { make in
            make.top.equalTo(superview?.safeAreaLayoutGuide ?? 10)
            make.left.equalTo(superview?.safeAreaLayoutGuide ?? 10)
            make.right.equalTo(superview?.safeAreaLayoutGuide ?? 10)
            make.bottom.equalTo(superview?.safeAreaLayoutGuide ?? 10)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.bottom.equalTo(stackView.snp.top).offset(-20)
            make.width.equalTo(180)
            make.left.equalTo(firstButton)
            make.height.equalTo(22)
        }
        
        checkPasswordButton.snp.makeConstraints { make in
            make.right.equalTo(firstButton.snp.right)
            make.centerY.equalTo(passwordTextField)
            make.height.equalTo(passwordTextField)
            make.left.equalTo(passwordTextField.snp.right).offset(20)
        }
        
        label.snp.makeConstraints { make in
            make.bottom.equalTo(passwordTextField.snp.top).offset(-20)
            make.centerX.equalTo(firstButton)
        }
        
        firstButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(250)
        }

        secondButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
    }
    
}

extension FeedView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        label.textColor = .black
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
