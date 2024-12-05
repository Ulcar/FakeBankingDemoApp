//
//  Coordinator.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 17/10/2024.
//

import Foundation
import UIKit

class Coordinator {
    func start() {}

    //    func notifyCoordinator<T>(event:NotifyEvent<T>)
    //    {
    //
    //    }
    //
    //    init(window: UIWindow) {
    //    }
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var currentController: UIViewController?

    override init() {
        navigationController = .init()
    }

    func start() -> UIViewController {
        let loginController = LoginViewController()
        loginController.coordinator = self
        navigationController = UINavigationController(
            rootViewController: loginController)
        return navigationController
    }

    func navigateToHomeScreen() {
        let homeViewController = HomeViewController(
            agreementViewModel: AgreementViewModel())
        homeViewController.coordinator = self
        navigationController.setViewControllers(
            [homeViewController], animated: true)
        navigationController.title = "Overzicht"
    }

    func navigateToAgreementSettingsScreen(withModel:BankAccountModel) {
        
        // create viewModel from received IBAN
        
        let viewModel:TransactionViewModel = TransactionViewModel(IBAN: withModel.accountNumber, service: JSONTransactionService())
        
        let agreementSettingsViewController = AgreementDetailsViewController(transactionViewModel: viewModel)
        agreementSettingsViewController.coordinator = self
        navigationController.pushViewController(
            agreementSettingsViewController, animated: true)
    }
}
