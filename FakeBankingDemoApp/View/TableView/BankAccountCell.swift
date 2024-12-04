//
//  AgreementTableView.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 14/11/2024.
//

import UIKit
import SwiftUI


class BankAccountCell:UITableViewCell, CustomAgreementCell{
    
    func configure(withModel: AgreementModel) {
        
        guard let model = withModel as? BankAccountModel else { return }
        configure(withModel: model)
    }
    
    func configure(withModel: BankAccountModel) {
        IbanLabel.text = withModel.accountNumber
        accountLabel.text = withModel.accountHolderName
        balanceLabel.text = withModel.balance
        selectedBackgroundView = UIView()
        
        
        
        
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
    
    var balanceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "€ 123,45"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bg)
        bg.addSubview(accountLabel)
        bg.addSubview(IbanLabel)
        bg.addSubview(balanceLabel)
        SetupConstraints()
        
        bg.layer.cornerRadius = 10
        
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            bg.backgroundColor = .systemGray5
            backgroundColor = .systemGray5
        }
        
        else {
            bg.backgroundColor = .white
            backgroundColor = .white
        }
        
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            bg.backgroundColor = .systemGray5
            backgroundColor = .systemGray
        }
        
        else {
            bg.backgroundColor = .white
            backgroundColor = .white
        }
    }
    
    
    func SetupConstraints()
    {
        NSLayoutConstraint.activate([
            bg.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            bg.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            bg.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            bg.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bg.heightAnchor.constraint(equalToConstant: 80),
            accountLabel.leftAnchor.constraint(equalTo: bg.layoutMarginsGuide.leftAnchor),
            accountLabel.topAnchor.constraint(equalTo: bg.layoutMarginsGuide.topAnchor, constant: 10),
            IbanLabel.leftAnchor.constraint(equalTo: accountLabel.leftAnchor),
            IbanLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 10),
            IbanLabel.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -20),
            balanceLabel.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -20),
            balanceLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor)
        ])
    }
}

#Preview
{
    let view = BankAccountCell()
    //changing backgroundColor for debugging purposes
    view.backgroundColor = .red
    view.bg.widthAnchor.constraint(equalToConstant: 400).isActive = true
    return view
}

