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
    var cachedData:[AgreementModel]?
    

    
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
        cachedData = agreementViewModel.Agreements
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
        return cachedData?.count ?? 0
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get type from indexpath
        
        // we can force unwrap this because we never enter this function if cachedData doesn't exist
        let cell = tableView.dequeueReusableCell(withIdentifier: cachedData?[indexPath.row].identifier ?? "", for: indexPath) as! CustomAgreementCell
        
        cell.configure(withModel: (cachedData?[indexPath.row])!)
        
        
        return cell as UITableViewCell
    }
    
    
    public func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                 "sectionHeader") as! AgreementTableViewHeader
        view.title.text = "Accounts"
        view.title.textColor = UIColor.orange


        return view
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
