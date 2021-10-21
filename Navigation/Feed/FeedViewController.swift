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

        
    }
    
    @IBAction func pressToSeePost(_ sender: Any) {
        print("ты увидел очень важный пост")
        
    }
    
    @IBAction func pressToSeePost2(_ sender: Any) {
        print("ты увидел очень важный пост")
    }
    
    struct Post {
        var title: String = "post"
    }
    
    var veryImportantPost = Post(title: "Very important post")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "fisrtButtonSeque" else {
            return
        }
        let postController = segue.destination
        postController.title = veryImportantPost.title
    }

}
