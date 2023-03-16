//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by Anton Stogov on 16/03/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let username = username {
            welcomeLabel.text = "\(username)"
        }
    }
}


    
