//
//  PinCell.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 06/11/2024.
//

import UIKit


class PinCell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    
    
    var numberLabel:UILabel = {
        let uiLabel = UILabel()
        uiLabel.text = "1"
        uiLabel.textAlignment = .center
        uiLabel.contentMode = .scaleToFill
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.font = UIFont(name: "RockWell", size: 20)
        uiLabel.backgroundColor = .orange
        return uiLabel
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addSubview(numberLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    func setupConstraints()
    {
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

#Preview {
    
    let cell = PinCell()
    
    return cell
}
