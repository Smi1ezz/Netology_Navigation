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
        self.hideKeyboard()
    }
    
    private func setupUI() {
        feedView.checkPasswordButton.buttonTapped = {
            let wordFromPassTextField = self.feedView.textFromTextField()
            
            if let safeWord = wordFromPassTextField {
                guard CheckerModel.instance.check(word: safeWord) else {return self.feedView.wrongPassMakeLabelRed() }
            
                self.feedView.firstButton.setTitleColor(.white, for: .normal)
                self.feedView.firstButton.buttonTapped = {
                    self.feedView.myController = self
                    let newVC = ImportantPostViewController()
                    self.navigationController?.pushViewController(newVC, animated: true)
                    
                    return self.feedView.reloadTextFieldAndButtons()
                }
                
                self.feedView.secondButton.setTitleColor(.white, for: .normal)
                self.feedView.secondButton.buttonTapped = {
                    self.feedView.myController = self
                    let newVC = ImportantPostViewController()
                    self.navigationController?.pushViewController(newVC, animated: true)
                    
                    return self.feedView.reloadTextFieldAndButtons()

                }
            } else {
                self.feedView.wrongPassMakeLabelRed()
            }
        return nil
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

