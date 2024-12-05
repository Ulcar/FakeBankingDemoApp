//
//  ViewController.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import UIKit

class AgreementDetailsViewController: UIViewController {
    var coordinator: Coordinator?
    var transactionViewModel:TransactionViewModel
    var tableView: UITableView = UITableView(frame: .zero, style: .grouped)
    var LoadingIcon: UIActivityIndicatorView = UIActivityIndicatorView(
        style: .medium)

    override func viewDidLoad() {
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    init(transactionViewModel:TransactionViewModel) {
        self.transactionViewModel = transactionViewModel
        super.init(nibName: nil, bundle: nil)
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.register(
            TransactionCell.self,
            forCellReuseIdentifier:TransactionCellTypes.transaction.rawValue)
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
        transactionViewModel.FetchTransactions(observer: { self.UpdateTableView() })
    }
}

#Preview {
    let loginViewController = HomeViewController(
        agreementViewModel: AgreementViewModel())
    return loginViewController
}

extension AgreementDetailsViewController: UITableViewDataSource, UITableViewDelegate {

    public func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {

        return transactionViewModel.transactions.count
    }

    public func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // get type from indexpath
        let model = getModelFromIndexPath(indexPath: indexPath)
        let cell = getCellFromIndexPath(indexPath: indexPath)
        cell.configure(withModel: model)

        return cell as UITableViewCell
    }

//    public func tableView(
//        _ tableView: UITableView,
//        viewForHeaderInSection section: Int
//    ) -> UIView? {
//
//        let headerView =
//            tableView.dequeueReusableHeaderFooterView(
//                withIdentifier:
//                    "sectionHeader") as! AgreementTableViewHeader
//        headerView.title.text =
//            agreementViewModel.agreements[section].accountGroupType
//        headerView.title.textColor = UIColor.orange
//
//        headerView.widthAnchor.constraint(
//            equalToConstant: tableView.frame.width
//        ).isActive = true
//        headerView.icon.leftAnchor.constraint(
//            equalTo: headerView.title.rightAnchor
//        ).isActive = true
//        return headerView
//    }

    public func tableView(
        _ tableView: UITableView, heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }

    public func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        // notify coordinator to append detail view
        let model = getModelFromIndexPath(indexPath: indexPath)
    }

    private func getModelFromIndexPath(indexPath: IndexPath) -> Transaction {
        return transactionViewModel.transactions[indexPath.row]
    }

    private func getCellFromIndexPath(indexPath: IndexPath)
        -> TransactionCell
    {
        let cell =
        tableView.dequeueReusableCell(withIdentifier: TransactionCellTypes.transaction.rawValue, for: indexPath)
        as! TransactionCell
        return cell
    }

}
