//
//  ViewController.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import UIKit

class LoginViewController: UIViewController{
    var coordinator: Coordinator?
    var loginView:UsernamePasswordLoginView = UsernamePasswordLoginView()
    
    var navbar = UITabBarController()
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        loginView.HeaderButton.addTarget(self, action: #selector(buttonTapped), for:.touchUpInside)
        view.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    override func loadView() {
        view = loginView
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        coordinator?.notifyCoordinator(event: IntEvent(payload: 3, status: EventStatus.Success, name: "test"))
      }
    
    required init(coordinator: Coordinator?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    


}

#Preview {
    let loginViewController = LoginViewController(coordinator: nil)
    return loginViewController
}
