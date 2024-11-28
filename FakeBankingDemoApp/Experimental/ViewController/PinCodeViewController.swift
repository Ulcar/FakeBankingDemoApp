//
//  ViewController.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import UIKit

class PinCodeViewController: UIViewController{
    var coordinator: Coordinator?
    var loginView:PinLoginView = PinLoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        loginView.headerButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.backgroundColor = .white
        loginView.isUserInteractionEnabled = true
        loginView.frame = CGRect(x:0, y: 0, width:view.frame.width, height:view.frame.height)
        
    }
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    


    
    @objc func buttonTapped(_ sender: UIButton) {
          print("Button tapped!")
        coordinator?.notifyCoordinator(event: IntEvent(payload: 3, status: EventStatus.Success, name: "test"))
      }
    
    required init(coordinator: Coordinator?) {
        //Why does this not compile without it?
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    


}


extension PinCodeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
    -> UIViewControllerAnimatedTransitioning? {
        return SwiftTransition(originFrame: loginView.frame)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 3
        if operation == .push {
            return SwiftTransition(originFrame: fromVC.view.frame)
        } else {
            return SwiftTransition(originFrame: fromVC.view.frame)
        }
    }
}



#Preview {
    let loginViewController = PinCodeViewController(coordinator: nil)
    return loginViewController
}
