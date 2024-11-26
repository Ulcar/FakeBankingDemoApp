//
//  HeaderView.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import Foundation
import UIKit


public class PinLoginView: UIView
{
    var headerLabel:UILabel?
    var headerButton:UIButton = UIButton()
    
    var pinCodeView:PincodeCollectionView = PincodeCollectionView()
    
    
    
    
    var imageView:UIImageView?
    
    override init(frame: CGRect) {
       
        
        super.init(frame: frame)
        setupView()
    }
    
    
    func viewDidLoad() {
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

        
        
        headerButton = UIButton()
        headerButton.backgroundColor = .systemBlue
        headerButton.setTitle("Log in", for:  UIControl.State.normal);
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        headerButton.setTitle("Pressed", for: UIControl.State.highlighted)
        
        headerButton.addTarget(self, action: #selector(ViewButtonTest), for: .touchUpInside)
    
        
        
        
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Welcome!"
        headerLabel.textAlignment = .right
        headerLabel.textColor = .black
        headerLabel.font = UIFont.boldSystemFont(ofSize: 40)
        headerLabel.bounds = self.bounds
        //??????
        pinCodeView.backgroundColor = .green
       


        backgroundColor = .systemBackground

        addSubview(headerLabel);
        addSubview(headerButton)
        addSubview(pinCodeView)

        SetupConstraints()
        
        func SetupConstraints()
        {
            NSLayoutConstraint.activate([

                headerButton.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
                headerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                headerLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                pinCodeView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                pinCodeView.topAnchor.constraint(equalTo: headerButton.bottomAnchor)
            ])
        }

        }
    
  
    
    
 
}



#Preview {
    
    

    let loginView = PinLoginView()
    return loginView
}
