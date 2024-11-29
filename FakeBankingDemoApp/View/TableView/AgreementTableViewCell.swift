////
////  AgreementTableView.swift
////  DemoAppWasTaken
////
////  Created by Schilperoort, L. (Lucas) on 14/11/2024.
////
//
//import UIKit
//import SwiftUI
//
//
//class AgreementTableViewCell:UITableViewCell, CustomAgreementCell{
//    
//    func configure(withModel: AgreementModel) {
//        // nothing to be done yet until we populate with data
//    }
//    
//    
//    lazy var bg:UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    
//    var label:UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.autoresizesSubviews = true
//        label.text = "testtestestesestestestesteastaestetawetewtewtw"
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(bg)
//        bg.addSubview(label)
//        SetupConstraints()
//        
//        }
//        
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    
//    
//    func SetupConstraints()
//    {
//        NSLayoutConstraint.activate([
//            bg.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//                   bg.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
//                   bg.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
//                   bg.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            bg.heightAnchor.constraint(equalTo: self.heightAnchor),
//            label.topAnchor.constraint(equalTo: bg.topAnchor, constant: 10),
//            label.leftAnchor.constraint(equalTo: bg.layoutMarginsGuide.leftAnchor),
//        ])
//    }
//}
//
//#Preview
//{
//    let view = AgreementTableViewCell()
//    return view
//}
//
