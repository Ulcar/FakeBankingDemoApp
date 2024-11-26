//
//  AccountCellWithIcon.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 25/11/2024.
//

import UIKit



class AccountCellWithIcon:UITableViewCell, CustomAgreementCell {
    static var identifier: String = "AccountCellWithIcon"
    
    func configure(withModel: any AgreementModel) {
        configure(withModel: withModel as! BankAccountModel)
    }
    
    func configure(withModel: BankAccountModel) {
        IbanLabel.text = withModel.IBAN
        accountLabel.text = withModel.NameCustomer
        
    }
    
    lazy var bg:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    var accountLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lucas Schilperoort:"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var IbanLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NL84 INGB 1234 5678 90:"
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
    
    var icon:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "plus")
        return imageView
    }()

    



    
    

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bg)
        bg.addSubview(accountLabel)
        bg.addSubview(IbanLabel)
        bg.addSubview(icon)
        SetupConstraints()
        
        bg.layer.cornerRadius = 10
        
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    func SetupConstraints()
    {
        NSLayoutConstraint.activate([
            bg.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                   bg.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
                   bg.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
                   bg.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bg.heightAnchor.constraint(equalToConstant: 100),
            bg.widthAnchor.constraint(equalToConstant: 400),
            icon.leftAnchor.constraint(equalTo: bg.layoutMarginsGuide.leftAnchor, constant: 20),
            icon.topAnchor.constraint(equalTo: bg.layoutMarginsGuide.topAnchor, constant: 20),
            accountLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20),
            accountLabel.topAnchor.constraint(equalTo: icon.topAnchor),
            IbanLabel.leftAnchor.constraint(equalTo: icon.rightAnchor),
            IbanLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            IbanLabel.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -20),
            
            
            
            
            
            
        ])
    }
}


#Preview
{
    let view = AccountCellWithIcon()
    return view
}
