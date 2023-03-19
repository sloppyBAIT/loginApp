//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by Anton Stogov on 16/03/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = User.getUserData()
        welcomeLabel.text = user.person.fullName
            
    }
}


