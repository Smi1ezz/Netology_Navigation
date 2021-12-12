//
//  ProfileViewController.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let postCellID = "PostCellID"
    let photosCellID = "PhotosCellID"
         
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupTableView()
        
        
        #if DEBUG
            view.backgroundColor = .lightGray
        #else
            view.backgroundColor = .red
        #endif
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postCellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosCellID)
        tableView.register(ProfileTableViewHeaderFooterView.self,
              forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.delegate = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        if section == 0 { result = 1 }
        else if section == 1 { result = Storage.posts.count }
        return result
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            let thisCell = tableView.dequeueReusableCell(withIdentifier: photosCellID) as? PhotosTableViewCell
            if let thisTable = thisCell {
                thisTable.photoFoto = Photogallery.photos[indexPath.row]
                thisTable.arrowButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                cell = thisTable
            }
        } else if indexPath.section == 1 {
            let thisCell = tableView.dequeueReusableCell(withIdentifier: postCellID) as? PostTableViewCell
            if let thisTable = thisCell {
                thisTable.post = Storage.posts[indexPath.row]
                cell = thisTable
            }
        }
        return cell
    }
    
    @objc func buttonClicked() {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PhotogalleryViewController") {
            print("ok")
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var result = UIView()
        if section == 0 {
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as? ProfileTableViewHeaderFooterView else { return nil }
            result = view
        }
        
        return result
    }

}

