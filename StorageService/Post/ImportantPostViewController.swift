//
//  PostViewController.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit

public class ImportantPostViewController: UIViewController {
    
    private var importantView = ImportantPostView()
    
    private lazy var alertButton = UIBarButtonItem(image: UIImage(systemName: "exclamationmark.triangle"), style: .done, target: self, action: #selector(alertAction))


    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(importantView)
        importantView.setupView()
        setupNavi()
    }
    
    private func setupNavi() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = importantView.veryImportantPost.title
        navigationItem.rightBarButtonItem = alertButton
    }
    
    //Все настройки проходят здесь, так как alert контроллер маленький
    @objc private func alertAction() {
        print("ALERT!!")
        let alertVC = UIAlertController(title: "WARNING!", message: "Ты уверен, что хочешь это развидеть?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            print("Слава богу ты одумался!")
        }
        
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            print("Жаль, что ты так твёрд в своем убеждении")
            self.navigationController?.popViewController(animated: true)
        }
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(okAction)
        navigationController?.present(alertVC, animated: true, completion: nil)
    }

}
