//
//  InfoViewController.swift
//  Navigation
//
//  Created by admin on 07.07.2021.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func alertCallAction(_ sender: Any) {
        
        let vc = UIAlertController(title: "WARNING", message: "Ты уверен, что хочешь это развидеть?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Слава богу ты одумался!")
        }
        
        let applyAction = UIAlertAction(title: "Apply", style: .default) { _ in
            print("Жаль, что ты так твёрд в своем убеждении")
        }
        
        vc.addAction(cancelAction)
        vc.addAction(applyAction)
        
        present(vc, animated: true, completion: nil)
        
    }
    
}
