//
//  FeedViewController.swift
//  Navigation
//
//  Created by admin on 27.06.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    let stackViewForButtons: UIStackView = {
        let firstButton: UIButton = {
            let firstButton = UIButton()
            firstButton.backgroundColor = .magenta
            firstButton.setTitle("Very important post", for: .normal)
            firstButton.titleLabel?.numberOfLines = 0
            firstButton.titleLabel?.textAlignment = .center
            firstButton.layer.cornerRadius = 8
            firstButton.addTarget(self, action: #selector(pressButtonImpPost), for: .touchUpInside)

            return firstButton
        }()
        
        let secondButton: UIButton = {
            let secondButton = UIButton()
            secondButton.backgroundColor = .brown
            secondButton.setTitle("Perhaps a very important post too", for: .normal)
            secondButton.titleLabel?.numberOfLines = 0
            secondButton.titleLabel?.textAlignment = .center
            secondButton.layer.cornerRadius = 8
            secondButton.addTarget(self, action: #selector(pressButtonImpPost), for: .touchUpInside)
            return secondButton
        }()
        
        let stackViewForButtons = UIStackView()
        stackViewForButtons.addArrangedSubview(firstButton)
        stackViewForButtons.addArrangedSubview(secondButton)
        stackViewForButtons.axis = .vertical
        stackViewForButtons.spacing = 10
        stackViewForButtons.distribution = .fillEqually
        
        
        return stackViewForButtons
    }()
    
    @objc func pressButtonImpPost() {
        print("ты увидел очень важный пост")
        let vc: UIViewController = PostViewController()
        vc.viewDidLoad()
        show(vc, sender: pressButtonImpPost)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackViewForButtons)
        
        stackViewForButtons.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewForButtons.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackViewForButtons.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackViewForButtons.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            stackViewForButtons.heightAnchor.constraint(equalTo: stackViewForButtons.widthAnchor, multiplier: 1.5, constant: 0)
            
        ])
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
    
    override func viewWillLayoutSubviews() {
        
        
    }

}
