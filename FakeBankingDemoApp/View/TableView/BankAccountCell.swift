//
//  AgreementTableView.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 14/11/2024.
//

import UIKit
import SwiftUI


class BankAccountCell:UITableViewCell, CustomAgreementCell{
    static var identifier: String = "AgreementTableViewCell"
    
    func configure(withModel: any AgreementModel) {
        configure(withModel: withModel as! BankAccountModel)
    }
    
    func configure(withModel: BankAccountModel) {
        IbanLabel.text = withModel.accountNumber
        accountLabel.text = withModel.accountHolderName
        
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
    



    
    

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bg)
        bg.addSubview(accountLabel)
        bg.addSubview(IbanLabel)
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
            accountLabel.leftAnchor.constraint(equalTo: bg.layoutMarginsGuide.leftAnchor),
            accountLabel.topAnchor.constraint(equalTo: bg.layoutMarginsGuide.topAnchor, constant: 20),
            IbanLabel.leftAnchor.constraint(equalTo: accountLabel.leftAnchor),
            IbanLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            IbanLabel.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -20)
            
            
            
            
            
        ])
    }
}

#Preview
{
    let view = BankAccountCell()
    //changing backgroundColor for debugging purposes
    view.backgroundColor = .red
    return view
}

