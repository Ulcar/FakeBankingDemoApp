//
//  ViewController.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import UIKit

class HomeViewController: UIViewController {
    var coordinator: Coordinator?
    var tableView: UITableView = UITableView(frame: .zero, style: .grouped)
    var agreementViewModel: AgreementViewModel
    var LoadingIcon: UIActivityIndicatorView = UIActivityIndicatorView(
        style: .medium)

    override func viewDidLoad() {
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    required init(agreementViewModel: AgreementViewModel) {
        self.agreementViewModel = agreementViewModel
        super.init(nibName: nil, bundle: nil)

    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.register(
            TotalBalanceViewCell.self,
            forCellReuseIdentifier: ModelToCellMapper.TotalBalance.rawValue)
        tableView.register(
            BankAccountCell.self,
            forCellReuseIdentifier: ModelToCellMapper.Account.rawValue)
        tableView.register(
            AgreementTableViewHeader.self,
            forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.register(
            AccountCellWithIcon.self,
            forCellReuseIdentifier: ModelToCellMapper.AccountWithIcon.rawValue)
        tableView.backgroundColor = .systemGray6
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(
            self,
            action:
                #selector(handleRefreshControl),
            for: .valueChanged)
    }

    func UpdateTableView() {
        tableView.reloadData()
        print("Updating tableview")
        self.tableView.refreshControl?.endRefreshing()
    }

    func setupView() {
        view.backgroundColor = .white
        setupTableView()
        view.addSubview(tableView)
        view.addSubview(LoadingIcon)
        LoadingIcon.startAnimating()
        SetupConstraints()
        agreementViewModel.FetchAgreements(observer: { self.UpdateTableView() })
    }

    func SetupConstraints() {
        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }

    @objc func handleRefreshControl() {
        agreementViewModel.FetchAgreements(observer: { self.UpdateTableView() })
    }
}

#Preview {
    let loginViewController = HomeViewController(
        agreementViewModel: AgreementViewModel())
    return loginViewController
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    public func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        let group = agreementViewModel.agreements[section]
        // adding total balance here?
        return group.accounts.count
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return agreementViewModel.agreements.count
    }

    public func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // get type from indexpath

        let model = agreementViewModel.agreements[indexPath.section].accounts[
            indexPath.row]
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: model.identifier.rawValue, for: indexPath)
            as! CustomAgreementCell
        cell.configure(withModel: model)

        return cell as UITableViewCell
    }

    public func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {

        let headerView =
            tableView.dequeueReusableHeaderFooterView(
                withIdentifier:
                    "sectionHeader") as! AgreementTableViewHeader
        headerView.title.text =
            agreementViewModel.agreements[section].accountGroupType
        headerView.title.textColor = UIColor.orange

        headerView.widthAnchor.constraint(
            equalToConstant: tableView.frame.width
        ).isActive = true
        headerView.icon.leftAnchor.constraint(
            equalTo: headerView.title.rightAnchor
        ).isActive = true
        return headerView
    }

    public func tableView(
        _ tableView: UITableView, heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }

}
