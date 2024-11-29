//
//  AgreementTableView.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 14/11/2024.
//

import UIKit
import SwiftUI


class TotalBalanceViewCell:UITableViewCell, CustomAgreementCell{
    
    func configure(withModel: AgreementModel) {
        // we know the type of model
        
        guard let model = withModel as? TotalBalanceModel else { return }
        //does the compiler know to use the other implementation of configure here?
        configure(withModel: model)
    }
    
    func configure(withModel:TotalBalanceModel){
        
        moneyLabel.text = withModel.totalBalance.formatted()
        selectionStyle = .none
    }
    
    
    lazy var bg:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()

    
    var totalLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Totaal:"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    var moneyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "€ 24.531.69"
        return label
    }()


    
    

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bg)
        bg.addSubview(totalLabel)
        bg.addSubview(moneyLabel)
        SetupConstraints()
        
        
        
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
            bg.heightAnchor.constraint(equalTo: totalLabel.heightAnchor, constant: 50),
            totalLabel.leftAnchor.constraint(equalTo: bg.layoutMarginsGuide.leftAnchor),
            totalLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
            moneyLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
            moneyLabel.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -20)
            
            
        ])
    }
}

#Preview
{
    let view = TotalBalanceViewCell()
    view.backgroundColor = .red
    view.layer.cornerRadius = 10
    return view
}

