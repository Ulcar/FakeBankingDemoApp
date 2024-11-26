//
//  Coordinator.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 17/10/2024.
//

import Foundation
import UIKit


class Coordinator
{
    
    let window:UIWindow
    
    func enter()
    {
        
    }
    
    func notifyCoordinator<T>(event:NotifyEvent<T>)
    {
        
    }
    
    init(window: UIWindow) {
        self.window = window
    }
}


class MainCoordinator:Coordinator
{

    var currentController:UIViewController?
    
    var navigationController:UINavigationController = {
        let controller = UINavigationController()
        return controller
    }()
    
    override init(window: UIWindow) {
        super.init(window: window)
        
    }
    
    override func enter() {
        let loginController = LoginViewController(coordinator: self)
        window.rootViewController = loginController
        
       
        
    }
    
    override func notifyCoordinator<T>(event: NotifyEvent<T>) {
        if(event is IntEvent)
        {
            if(event.status == EventStatus.Success)
            {
                let mainScreenController = HomeViewController(coordinator: self)
                window.rootViewController = navigationController
                navigationController.setViewControllers([mainScreenController], animated: true)
                navigationController.title = "Overzicht"
            }
        }
    }
}

class NotifyEvent<T>
{
    
    
    var payload:T
    var status:EventStatus = EventStatus.Invaild
    var name:String = ""
    
    init(payload: T, status: EventStatus, name:String) {
        self.payload = payload
        self.status = status
        self.name = name
    }
    
}

class IntEvent:NotifyEvent<Int>
{
    
}

enum EventStatus
{
    case Success,Invaild
}

