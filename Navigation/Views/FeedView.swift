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
    
//    private let firstButton: UIButton = {
//        let button = UIButton()
//        return button
//    }()
    
//    private let secondButton: UIButton = {
//        let button = UIButton()
//        return button
//    }()
    
    let firstButton: CustomButton = {
        let button = CustomButton(title: "tap to see inportand post", tintColor: .white, action: nil)
        return button
    }()
    
    let secondButton: CustomButton = {
        let button = CustomButton(title: "tap to see wery inportand post", tintColor: .white, action: nil)
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
        setButtonStyle(button: firstButton)
        setButtonStyle(button: secondButton)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        self.addSubview(stackView)
        self.backgroundColor = .white
        setupConstraints()
    }
    
    private func setButtonStyle(button: UIButton) {
        button.backgroundColor = UIColor(named: "ColorForPostButton")
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        for i in [stackView, firstButton, secondButton] {
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

