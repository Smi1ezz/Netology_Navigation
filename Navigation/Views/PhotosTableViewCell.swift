//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by admin on 28.09.2021.
//

import UIKit
import StorageService


class PhotosTableViewCell: UITableViewCell {
    
    weak var myViewController: UIViewController?
    
    var photoFoto: Photo? {
        didSet {
            for i in [photo1,photo2,photo3,photo4] {
                setupPhoto(photo: i)
            }
            var counter = 0
            for j in [photo1,photo2,photo3,photo4] {
                j.image = UIImage(named: photoFoto?.images[counter] ?? "house")
                counter += 1
            }
        }
    }
    
    let cellLabel: UILabel = {
        let cellLabel = UILabel()
        cellLabel.text = "Photos"
        cellLabel.textColor = .black
        cellLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        return cellLabel
    }()
    
    //MARK: класс изменен на CustomButton для задания 6 - mvc
    let arrowButton: CustomButton = {
        let arrowButton = CustomButton(title: "в галерею", tintColor: .black, action: nil)
        
        arrowButton.setBackgroundImage(UIImage(systemName: "arrow.forward"), for: .normal)
        arrowButton.contentMode = .scaleAspectFill
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        arrowButton.tintColor = .black
        return arrowButton
    }()
    
    let photosStackView: UIStackView = {
        let photosStackView = UIStackView()
        photosStackView.spacing = 8
        photosStackView.axis = .horizontal
        photosStackView.distribution = .fillEqually
        photosStackView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        photosStackView.translatesAutoresizingMaskIntoConstraints = false
        return photosStackView
    }()
    
    let photo1: UIImageView = {
        let photo = UIImageView()
        return photo
    }()
    
    let photo2: UIImageView = {
        let photo = UIImageView()
        return photo
    }()
    
    let photo3: UIImageView = {
        let photo = UIImageView()
        return photo
    }()
    
    let photo4: UIImageView = {
        let photo = UIImageView()
        return photo
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsInCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        print("awake from Nib")
        setupViewsInCell()
    }
    
    private func setupViewsInCell() {
        contentView.addSubview(cellLabel)
        contentView.addSubview(arrowButton)
        photosStackView.addArrangedSubview(photo1)
        photosStackView.addArrangedSubview(photo2)
        photosStackView.addArrangedSubview(photo3)
        photosStackView.addArrangedSubview(photo4)
        contentView.addSubview(photosStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 12),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            
            arrowButton.centerYAnchor.constraint(equalTo: cellLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowButton.widthAnchor.constraint(equalToConstant: 24),
            arrowButton.heightAnchor.constraint(equalToConstant: 24),
            
            photosStackView.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 12),
            photosStackView.leadingAnchor.constraint(equalTo: cellLabel.leadingAnchor),
            photosStackView.trailingAnchor.constraint(equalTo: arrowButton.trailingAnchor),
            photosStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    private func setupPhoto(photo: UIImageView) {
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.heightAnchor.constraint(equalTo: photosStackView.heightAnchor).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }


}
