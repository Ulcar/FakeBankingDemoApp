//
//  HeaderView.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import Foundation
import UIKit

public class ButtonCollectionView:UIView
{
    var headerButton:UIButton?
    
    //var data:[ElementProperties] = [ElementProperties(footerText: "element1", imageAsset: "TestImage"), ElementProperties(footerText: "Element2", imageAsset: "TestImage")]
    var data:[ElementProperties] =
    {
        var properties:[ElementProperties] = []
        
        for i in 1 ... 1000
        {
            
            
            properties.append(ElementProperties(footerText: "element " + String(i), imageAsset: "TestImage"))
        
        }
        return properties
    }()
    private lazy var tableView: UICollectionView = {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 20
            flowLayout.minimumInteritemSpacing = 30
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        print(ElementCell.self)
        collectionView.register(ElementCell.self, forCellWithReuseIdentifier: ElementCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        var test = ButtonCollectionView.self
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
    
    
    var imageView:UIImageView?
    
    var childConstraints:[NSLayoutConstraint] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder);
        fatalError()
    }
    
    
    
    func setupView() {
        backgroundColor = .systemBackground
        addSubview(tableView)
        
        
        
        

        tableView.translatesAutoresizingMaskIntoConstraints = false
        childConstraints.append(tableView.topAnchor.constraint(equalTo: self.topAnchor))
        childConstraints.append(tableView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor))
        childConstraints.append(tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        childConstraints.append(tableView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor))
 
        SetupConstraints()
        
        func SetupConstraints()
        {
//            childConstraints.append(contentsOf:[
//                headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//                headerLabel.topAnchor.constraint(equalTo: self.laoutMarginsGuide.topAnchor),
//            ])
            NSLayoutConstraint.activate(childConstraints)
        }
        
        
        
        
     
        }
    
  
    
    
 
}



#Preview {
    

    let loginView = ButtonCollectionView()
    return loginView
}




extension ButtonCollectionView: UICollectionViewDelegate {

   public func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

    }
}

extension ButtonCollectionView: UICollectionViewDataSource {

   public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        data.count
    }

   public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ElementCell.identifier,
            for: indexPath
        ) as! ElementCell

        let data = data[indexPath.item]
        cell.footerLabel.text = String(data.footerText)
        cell.imageView.image = UIImage(named: data.imageAsset)
        cell.backgroundColor = data.backgroundColor
        return cell
    }
}
