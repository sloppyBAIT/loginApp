//
//  UserInfoViewController.swift
//  loginApp
//
//  Created by Anton Stogov on 18/03/2023.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var secondNameLabel: UILabel!
    @IBOutlet var jobTitleLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = User.getUserData()
        firstNameLabel.text = user.person.firstName
        secondNameLabel.text = user.person.secondName
        jobTitleLabel.text = user.person.jobTitle
        cityLabel.text = user.person.city
        companyLabel.text = user.person.company
        bioLabel.text = user.person.bio
    }
}
