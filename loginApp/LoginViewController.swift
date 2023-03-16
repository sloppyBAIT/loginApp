//
//  LoginViewController.swift
//  loginApp
//
//  Created by Anton Stogov on 16/03/2023.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openWelcomeVC" {
            guard let secondVC = segue.destination as? WelcomeViewController else {
                return
            }
            secondVC.username = loginTextField.text
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let login = loginTextField.text, !login.isEmpty else {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Пожалуйста, введите логин.",
                preferredStyle: .alert)
            alertController.addAction(UIAlertAction(
                title: "ОК",
                style: .default,
                handler: nil))
            present(alertController,
                    animated: true,
                    completion: nil)
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Пожалуйста, введите пароль.",
                preferredStyle: .alert)
            alertController.addAction(UIAlertAction(
                title: "ОК",
                style: .default,
                handler: nil))
            present(alertController,
                    animated: true,
                    completion: nil)
            return
        }
        
        if login == "Admin" && password == "Admin" {
        } else {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Неверный логин или пароль",
                preferredStyle: .alert)
            alertController.addAction(UIAlertAction(
                title: "ОК",
                style: .default,
                handler: nil))
            present(alertController,
                    animated: true,
                    completion: nil)
        }
    }
    
    @IBAction func forgotLoginTapped(_ sender: Any) {
        showLoginAlert()
    }
    func getLogin() -> String? {
        return "Admin"
    }
    func showLoginAlert() {
        let login = getLogin()
        let alertController = UIAlertController(
            title: "Ваш логин",
            message: login,
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "OK",
            style: .default))
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        passwordTextField.text = ""
        loginTextField.text = ""
        
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        showPasswordAlert()
    }
    func getPaswword() -> String? {
        return "Admin"
    }
    func showPasswordAlert() {
        let password = getPaswword()
        let alertController = UIAlertController(
            title: "Ваш пароль",
            message: password,
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "OK",
            style: .default))
        present(alertController,
                animated: true,
                completion: nil)
    }

}

