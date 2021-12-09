//
//  PhotogalleryCollectionViewCell.swift
//  Navigation
//
//  Created by admin on 18.10.2021.
//

import UIKit


class PhotogalleryCollectionViewCell: UICollectionViewCell {
    
    let photo: UIImageView = {
        let photo = UIImageView()
//        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.backgroundColor = .brown
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photo)
        photo.frame = contentView.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

