//
//  ProfileTableViewHeaderFooterView.swift
//  Navigation
//
//  Created by admin on 26.08.2021.
//

import UIKit
import SnapKit

class ProfileTableViewHeaderFooterView: UITableViewHeaderFooterView {

    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        
        avatarImageView.image = UIImage(named: "sergejzverev_27")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 150/2
        avatarImageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        avatarImageView.layer.borderWidth = 3
        
        return avatarImageView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()

        nameLabel.text = "Эдвард-Руки-Ножницы"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 0
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
        
        showStatusButton.layer.cornerRadius = 14
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOffset.width = 4
        showStatusButton.layer.shadowOffset.height = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        
        return showStatusButton
    }()
    
    override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            configureContents()
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureContents() {
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(statusTextField)
        contentView.addSubview(showStatusButton)
        
        for item in [nameLabel, avatarImageView, statusTextField, showStatusButton] {
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView).offset(11)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        statusTextField.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
            make.bottom.equalTo(avatarImageView).offset(-18)
        }
        
        showStatusButton.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-16)
        }
        
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
