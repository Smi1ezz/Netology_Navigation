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

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func alertCallAction(_ sender: Any) {
        
        let vc = UIAlertController(title: "WARNING", message: "ты уверен, что хочешь это развидеть?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("слава богу ты одумался!")
        }
        
        let applyAction = UIAlertAction(title: "Apply", style: .default) { _ in
            print("я твёрд в своем убеждении")
        }
        
        vc.addAction(cancelAction)
        vc.addAction(applyAction)
        
        present(vc, animated: true, completion: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
