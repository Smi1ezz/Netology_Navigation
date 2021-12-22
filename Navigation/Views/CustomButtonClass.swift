//
//  CustomButton.swift
//  Navigation
//
//  Created by admin on 15.12.2021.
//

import Foundation
import UIKit

protocol Tappable: UIViewController {
    func didTapLogInButton()->Void?
}

class CustomButton: UIButton {
    
    private var title: String
    private var myTintColor: UIColor?
    var buttonTapped: (()->Void?)?
    
    let button = UIButton()
    
    init(title: String, tintColor: UIColor?, action: (()->Void?)? ) {
        self.title = title
        self.myTintColor = tintColor
        self.buttonTapped = action
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.tintColor = myTintColor
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc private func buttonAction() {
        guard let safeButonTapped = buttonTapped else { return }
        safeButonTapped()
    }
    
}
