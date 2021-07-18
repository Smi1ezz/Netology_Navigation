//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by admin on 14.07.2021.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        
        avatarImageView.image = UIImage(named: "sergejzverev_27")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        avatarImageView.layer.borderWidth = 3
        return avatarImageView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()

        nameLabel.text = "Эдвард-Руки-Ножницы"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .left
        
        return nameLabel
    }()
    
    let statusTextField: UITextField = {
        let statusTextField = UITextField()
        
        statusTextField.placeholder = "Вставь умную мысль"
        statusTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        statusTextField.textColor = .gray
        
        return statusTextField
    }()
    
    let showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        
        showStatusButton.backgroundColor = .blue
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.addTarget(self, action: #selector(printStatusAction), for: .touchUpInside)
        
        return showStatusButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        addSubview(avatarImageView)
        addSubview(statusTextField)
        addSubview(showStatusButton)
    
    }
    
    override func layoutSubviews() {
        
        let avatarSize = bounds.width/3
        
        nameLabel.frame = CGRect(x: 16 + avatarSize + 10, y: safeAreaInsets.top + 27, width: bounds.width - (bounds.width/3 + 16 + 10 + 16), height: nameLabel.font.lineHeight)
        
        avatarImageView.frame = CGRect(x: 16, y: safeAreaInsets.top + 16, width: avatarSize, height: avatarSize)
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width/2
        
        statusTextField.frame = CGRect(x: 16 + avatarSize + 10, y: avatarImageView.frame.maxY - 18 - (statusTextField.font?.lineHeight ?? 30), width: bounds.width - (avatarSize + 16 + 10 + 16), height: statusTextField.font?.lineHeight ?? 30)
        
        showStatusButton.frame = CGRect(x: 16, y: statusTextField.frame.maxY + 34, width: bounds.width - 32, height: 50)
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOffset.width = 4
        showStatusButton.layer.shadowOffset.height = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7

    }
    
    @objc func printStatusAction() {
        if statusTextField.text != "" {
            print("\(String(describing: statusTextField.text!))")
        } else if statusTextField.placeholder != nil {
            print("\(String(describing: statusTextField.placeholder!))")
        } else if statusTextField.placeholder == nil {
            print("Пустовато тут. Даже плейсхолдера нет")
        }
    }
    
}





