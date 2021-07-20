//
//  ProfileViewController.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit

class ProfileViewController: UIViewController {
     
    let profileHeader = ProfileHeaderView()
    
    let unknownButton: UIButton = {
        let unknownBotton = UIButton()
        
        unknownBotton.setTitle("Unknown Button", for: .normal)
        unknownBotton.backgroundColor = .yellow
        unknownBotton.setTitleColor(.black, for: .normal)
        
        return unknownBotton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
    }
   
    override func viewWillLayoutSubviews() {
        setupViews()

    }
    
    private func setupViews() {
        
        view.addSubview(profileHeader)
        view.addSubview(unknownButton)
        
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeader.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeader.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeader.bottomAnchor.constraint(equalTo: profileHeader.showStatusButton.bottomAnchor)
            //profileHeader.heightAnchor.constraint(equalToConstant: 220) не работает, потомучто ,мне кажется, картинка должна меняться в зависимости от экрана. А тогда кнопка проваливает hittest
        ])
        
        unknownButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            unknownButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            unknownButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            unknownButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            unknownButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
