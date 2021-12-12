//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by admin on 23.08.2021.
//

import UIKit
import iOSIntPackage

public class PostTableViewCell: UITableViewCell {
    
    private var imageProcessor = ImageProcessor()
    
    public var post: Post? {
        didSet {
            postLabel.text = post?.author
            postImageView.image = UIImage.init(named: post?.image ?? "logo")
            imageProcessor.processImage(
                sourceImage: (postImageView.image ?? UIImage.init(named: "logo"))!,
                filter: ColorFilter.allCases.randomElement() ?? .colorInvert,
                completion: {
                    filtredImg in postImageView.image = filtredImg
                }
            )
            postDescriptionLabel.text = post?.description
            likesCounterLabel.text = String("likes: \(post?.likes ?? 2)")
            viewsCounterLabel.text = String("views: \(post?.views ?? 2)")
        }
    }
    
    var postLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.numberOfLines = 2
        postLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postLabel.textColor = .black
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLabel
    }()
    
    let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.backgroundColor = .black
        postImageView.contentMode = .scaleAspectFit
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    
    let postDescriptionLabel: UILabel = {
        let postDescriptionLabel = UILabel()
        postDescriptionLabel.numberOfLines = 0
        postDescriptionLabel.textColor = .systemGray
        postDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return postDescriptionLabel
    }()
    
    let likesAndViewsStackView: UIStackView = {
        let likesAndViewsStackView = UIStackView()
        likesAndViewsStackView.axis = .horizontal
        likesAndViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        return likesAndViewsStackView
    }()
    
    let likesCounterLabel: UILabel = {
        let likesCounterLabel = UILabel()
        likesCounterLabel.textColor = .black
        likesCounterLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return likesCounterLabel
    }()
    
    let viewsCounterLabel: UILabel = {
        let viewsCounterLabel = UILabel()
        viewsCounterLabel.textColor = .black
        viewsCounterLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return viewsCounterLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsInCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViewsInCell()
    }

    func setupViewsInCell() {
        contentView.addSubview(postLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(postDescriptionLabel)
        likesAndViewsStackView.addArrangedSubview(likesCounterLabel)
        likesAndViewsStackView.addArrangedSubview(viewsCounterLabel)
        contentView.addSubview(likesAndViewsStackView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            postLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            postLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            postImageView.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            postDescriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesAndViewsStackView.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
            likesAndViewsStackView.leadingAnchor.constraint(equalTo: postDescriptionLabel.leadingAnchor),
            likesAndViewsStackView.trailingAnchor.constraint(equalTo: postDescriptionLabel.trailingAnchor),
            likesAndViewsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
            likesCounterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
    }
        
}
