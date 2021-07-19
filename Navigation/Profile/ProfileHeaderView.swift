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
        
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOffset.width = 4
        showStatusButton.layer.shadowOffset.height = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        
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
        
        print("header layout")
        print(avatarImageView.frame.width)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
            
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 11)
        ])
        
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            statusTextField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant:  -18)
        ])
        
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
        //не получается посчитать правильные скругления углов при повороте экрана. Не пойму в каком месте актуальные размеры avatarImageView. при повороте, кажется, он использует размеры предыдущего изображения. Пожвлуйста скажите, где ошибка. Сделал всю работу меньше, чем за час, а с этим бьюсь уже больше 3х часов.

    }
    
    @objc func printStatusAction() {
        if let statusText = statusTextField.text {
            guard statusText != "" else {
                if let placeholderText = statusTextField.placeholder {
                    return print("\(placeholderText)")
                } else {
                    return print("Пустовато тут. Даже плейсхолдера нет")
                }
            }
            return print("\(statusText)")
        }
    }
    
}





