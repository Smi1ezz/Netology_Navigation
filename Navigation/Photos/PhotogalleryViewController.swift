//
//  PhotogalleryViewController.swift
//  Navigation
//
//  Created by admin on 15.10.2021.
//

import UIKit
import StorageService

class PhotogalleryViewController: UIViewController {

    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    let photoCellID = "photoCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setupCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotogalleryCollectionViewCell.self, forCellWithReuseIdentifier: photoCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension PhotogalleryViewController: UICollectionViewDelegate {
    
}

extension PhotogalleryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Photogallery.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var safeCell = PhotogalleryCollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellID, for: indexPath) as? PhotogalleryCollectionViewCell
        if let safe = cell {
            safeCell = safe
        }
        safeCell.photo.image = UIImage(named: Photogallery.photos[indexPath.item].image)
        return safeCell
    }
}

extension PhotogalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sumOfInsetsInLine = CGFloat(8*4)
        let numOfItemsInLine: CGFloat = 3
        return CGSize(width: (UIScreen.main.bounds.width-sumOfInsetsInLine)/numOfItemsInLine, height: (UIScreen.main.bounds.width-sumOfInsetsInLine)/numOfItemsInLine)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section), \(indexPath.item)")
    }
}
