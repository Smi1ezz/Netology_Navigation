//
//  FeedViewController.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit
import SnapKit
import StorageService

class FeedViewController: UIViewController {
    
    private var router: FeedRouter
    
    private let feedView = FeedView(frame: .zero)
    
    init(router: FeedRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)

        self.router.presenter = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        feedView.firstButton.butonTapped = {
            self.feedView.myController = self
            let newVC = ImportantPostViewController()
            return self.navigationController?.pushViewController(newVC, animated: true)
        }
        feedView.secondButton.butonTapped = {
            self.feedView.myController = self
            let newVC = ImportantPostViewController()
            return self.navigationController?.pushViewController(newVC, animated: true)
        }
        
        view.addSubview(feedView)
        setupConstraints()
        setupNaviBar()
    }
    
    private func setupNaviBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Tab&NaviBarColor")
        
        navigationItem.title = "Feed"
    }
    
    private func setupConstraints() {
        feedView.setupView()
    }

}
