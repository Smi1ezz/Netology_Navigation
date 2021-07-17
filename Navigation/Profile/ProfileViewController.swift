//
//  ProfileViewController.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit

class ProfileViewController: UIViewController {
     
    let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

    }
    
    private func setupViews() {
        
        
        view.addSubview(profileHeader)
        
        
        profileHeader.frame = view.frame
//        profileHeader.backgroundColor = .blue

    }
   
    override func viewWillLayoutSubviews() {
        setupViews()
        
        
    }
    


}
