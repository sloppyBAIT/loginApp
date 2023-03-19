//
//  ProjectViewController.swift
//  loginApp
//
//  Created by Anton Stogov on 19/03/2023.
//

import UIKit

class ProjectViewController: UIViewController {
    
    @IBOutlet var projectLabel: UILabel!
    @IBOutlet var projectBioLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = User.getUserData()
        projectLabel.text = user.person.project
        projectBioLabel.text = user.person.projectBio
    }
}

