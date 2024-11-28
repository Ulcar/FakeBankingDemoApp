//
//  CustomAgreementElement.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 14/11/2024.
//

import UIKit


protocol CustomAgreementCell: UITableViewCell {
    
    static var identifier: String { get set}
    func configure(withModel: Any)
}
