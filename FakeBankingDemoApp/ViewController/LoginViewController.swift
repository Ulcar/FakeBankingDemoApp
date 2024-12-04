//
//  ViewController.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    var coordinator: MainCoordinator?
    var loginView: UsernamePasswordLoginView = UsernamePasswordLoginView()

    var navbar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        loginView.loginButton.addTarget(
            self, action: #selector(buttonTapped), for: .touchUpInside)
        view.isUserInteractionEnabled = true
        loginView.loginField.delegate = self
        loginView.passwordField.delegate = self
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor),
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

    }
    override func loadView() {
        view = loginView
    }

    @objc func buttonTapped(_ sender: UIButton) {
        CheckPassword()
    }

    func CheckPassword() {
        if loginView.loginField.text == "ING"
            && loginView.passwordField.text == "123"
        {
            coordinator?.navigateToHomeScreen()
        } else {
            loginView.loginField.text = ""
            loginView.passwordField.text = ""
            loginView.loginField.placeholder = "Invalid Username"
            loginView.passwordField.placeholder = "Invalid Password"
            // create extra subview for invaild password label
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  //delegate method
        textField.resignFirstResponder()
        CheckPassword()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        loginView.loginButton.backgroundColor = .orange
        loginView.loginButton.isUserInteractionEnabled = true
    }
}

#Preview {
    let loginViewController = LoginViewController()
    return loginViewController
}
