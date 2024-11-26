//
//  ElementCell.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/10/2024.
//

import Foundation
import UIKit




public class ElementCell:UICollectionViewCell
{
    static var identifier: String = "Cell"
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "invaildImage")
        return imageView
    }()
    
    var footerLabel:UILabel = {
        let uiLabel = UILabel()
        uiLabel.text = "Default text"
        uiLabel.textAlignment = .center
        uiLabel.contentMode = .scaleToFill
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.font = UIFont(name: "RockWell", size: 20)
        return uiLabel
    }()
    
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(footerLabel)
        
        setupConstraints()
        
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setupConstraints()
    {
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            footerLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            footerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            footerLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            footerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}

#Preview
{
    let cell = ElementCell()
    
    let properties = ElementProperties(footerText: "Hello World", imageAsset: "INGLion", backgroundColor: .red)
    
    cell.backgroundColor = properties.backgroundColor
    cell.footerLabel.text = properties.footerText
    cell.imageView.image = UIImage(named: properties.imageAsset)
    cell.imageView.backgroundColor = .blue
    cell.footerLabel.backgroundColor = .green
    
    return cell
}


public struct ElementProperties
{
    var footerText:String
    var imageAsset:String
    var backgroundColor:UIColor
    
    
    init(footerText: String, imageAsset: String, backgroundColor:UIColor = .white) {
        self.footerText = footerText
        self.imageAsset = imageAsset
        self.backgroundColor = backgroundColor
            
    }
}
