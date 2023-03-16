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

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let login = loginTextField.text, !login.isEmpty else {
            showAlert(
                title: "Ошибка",
                message: "Пожалуйста, введите логин.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(
                title: "Ошибка",
                message: "Пожалуйста, введите пароль.")
            return
        }
        if login == "Admin" && password == "Admin" {
            performSegue(
                withIdentifier: "openWelcomeVC",
                sender: self)
        } else {
            showAlert(
                title: "Ошибка",
                message: "Неверный логин или пароль")
        }
    }

    @IBAction func forgotLoginTapped(_ sender: Any) {
        showInfoAlert(
            title: "Ваш логин",
            message: "Admin")
    }

    @IBAction func forgotPasswordTapped(_ sender: Any) {
        showInfoAlert(
            title: "Ваш пароль",
            message: "Admin")
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

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "ОК",
            style: .default))
        present(alertController, animated: true)
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

    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        passwordTextField.text = ""
        loginTextField.text = ""
    }

}


