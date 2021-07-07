//
//  FeedViewController.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressButton(_ sender: Any) {
        print("ты увидел очень важный пост")
    }
    
    struct Post {
        var title: String = "post"
    }
    
    var veryImportantPost = Post(title: "Very important post")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "importantPost" else {
            return
        }
        let postController = segue.destination
        postController.title = veryImportantPost.title
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
