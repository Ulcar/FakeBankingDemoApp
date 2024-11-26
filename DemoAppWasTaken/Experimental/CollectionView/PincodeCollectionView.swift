//
//  PincodeCollectionView.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 06/11/2024.
//


import UIKit


class PincodeCollectionView: UIView {
   
    var childConstraints:[NSLayoutConstraint] = []
    
    
    var amountOfButtons = 9
    

    private lazy var pinCollectionView: UICollectionView = {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 20
            flowLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(PinCell.self, forCellWithReuseIdentifier: PinCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .red
            collectionView.showsVerticalScrollIndicator = false
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
    
    
    override init(frame: CGRect) {
       
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    @objc func ViewButtonTest()
    {
        print("Tap from loginview!")
    }
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubview(pinCollectionView)
    }
    
    func viewDidLoad() {
        setupView()
        
    }
}


#Preview
{
    return PincodeCollectionView()
}

extension PincodeCollectionView: UICollectionViewDelegate {
    
}

extension PincodeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        amountOfButtons
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let text = String(indexPath.item)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinCell.identifier, for: indexPath) as! PinCell
        cell.numberLabel.text = text
        return cell
        
    }
    
    
}
