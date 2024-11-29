//
//  ViewController.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import UIKit

class LoginViewController: UIViewController{
    var coordinator: MainCoordinator?
    var loginView:UsernamePasswordLoginView = UsernamePasswordLoginView()
    
    var navbar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        loginView.loginButton.addTarget(self, action: #selector(buttonTapped), for:.touchUpInside)
        view.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])

    }
    override func loadView() {
        view = loginView
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        if loginView.loginField.text == "ING" && loginView.passwordField.text == "123" {
            coordinator?.navigateToHomeScreen()
        }
        
        else {
            loginView.loginField.text = ""
            loginView.passwordField.text = ""
            loginView.loginField.placeholder = "Invalid Username"
            loginView.passwordField.placeholder = "Invalid Password"
            // create extra subview for invaild password label
        }
        
        
        
      }
}

#Preview {
    let loginViewController = LoginViewController()
    return loginViewController
}
