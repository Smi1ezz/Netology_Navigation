//
//  ImportantPostView.swift
//  Navigation
//
//  Created by admin on 21.12.2021.
//

import Foundation
import UIKit

class ImportantPostView: UIView {
    
    var veryImportantPost = ImportantPost(title: "Very important post")
    
    private let imageForPost: UIImageView = {
        let image = UIImage(named: "catWithHands")
        let imageForPost = UIImageView(image: image)
        return imageForPost
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = UIColor(named: "ColorForPostButton")
        self.addSubview(imageForPost)
        setupConstraints()
    }
    
    private func setupConstraints() {
        for i in [self, imageForPost] {
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor),
            
            imageForPost.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageForPost.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageForPost.heightAnchor.constraint(equalToConstant: 300),
            imageForPost.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}
