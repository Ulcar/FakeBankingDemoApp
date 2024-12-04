//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 17/10/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = MainCoordinator().start()
        window?.makeKeyAndVisible()

        // Override point for customization after application launch.
        return true
    }

}
