//
//  LoginViewController.swift
//  loginApp
//
//  Created by Anton Stogov on 16/03/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    
    let login = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openWelcomeVC" {
            guard let welcomeVC = segue.destination as? WelcomeViewController else {
                return
            }
            welcomeVC.user = login
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func loginButtonTapped() {
        guard loginTextField.text == login.login, passwordTextField.text == login.password else {
            showInfoAlert(
                title: "Ошибка",
                message: "Пожалуйста, введите логин или пароль."
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotLoginTapped(_ sender: UIButton) {
        sender.tag == 0
            ? showInfoAlert(title: "Ваш логин", message: "\(login.login)")
            : showInfoAlert(title: "Ваш пароль", message: "\(login.password)")
    }
    
    func showInfoAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "OK",
            style: .default))
        present(alertController, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        passwordTextField.text = ""
        loginTextField.text = ""
    }
    
}
