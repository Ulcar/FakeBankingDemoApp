//
//  ViewController.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import UIKit

class HomeViewController: UIViewController{
    var coordinator: Coordinator?
    var tableView:UITableView = UITableView(frame: .zero, style:.grouped)
    var agreementViewModel:AgreementViewModel = AgreementViewModel()
    var cachedData:[AccountGroup] = []
    

    
    override func viewDidLoad() {
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        
        
    }
    
    @objc func ViewButtonTest()
    {
        print("Tap from loginview!")
    }
    
    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.register(TotalBalanceViewCell.self, forCellReuseIdentifier: TotalBalanceViewCell.identifier)
        tableView.register(BankAccountCell.self, forCellReuseIdentifier: BankAccountCell.identifier)
        tableView.register(AgreementTableViewHeader.self,
               forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.register(AccountCellWithIcon.self, forCellReuseIdentifier: AccountCellWithIcon.identifier)
        tableView.backgroundColor = .systemGray4
        
    }
    
    func setupView() {


        view.backgroundColor = .white
        setupTableView()
        view.addSubview(tableView)
        
        SetupConstraints()
        cachedData = agreementViewModel.GetAgreements()
        
        
        func SetupConstraints()
        {
            NSLayoutConstraint.activate([

                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                        tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                        tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
        
        }
    
    required init(coordinator: Coordinator?) {
        //Why does this not compile without it?
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
    }

}

#Preview {
    let loginViewController = HomeViewController(coordinator: nil)
    return loginViewController
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    
  
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var wtf = cachedData[section]
        return wtf.accounts.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return cachedData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get type from indexpath
        
        // we can force unwrap this because we never enter this function if cachedData doesn't exist
        let model = cachedData[indexPath.section].accounts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.identifier, for: indexPath) as! CustomAgreementCell
        
        cell.configure(withModel: model)
        
        
        return cell as UITableViewCell
    }
    
    
    public func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                 "sectionHeader") as! AgreementTableViewHeader
        headerView.title.text = cachedData[section].accountGroupType
        headerView.title.textColor = UIColor.orange

        headerView.widthAnchor.constraint(equalToConstant: tableView.frame.width).isActive = true
        headerView.icon.leftAnchor.constraint(equalTo: headerView.title.rightAnchor, constant: view.frame.width * 0.55).isActive = true
        return headerView
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
