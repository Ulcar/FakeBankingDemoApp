//
//  HeaderView.swift
//  DemoApp
//
//  Created by Schilperoort, L. (Lucas) on 14/10/2024.
//

import Foundation
import UIKit


public class UsernamePasswordLoginView: UIView
{
    var HeaderLabel:UILabel = UILabel()
    var LoginField:UITextField = UITextField()
    var CompanyImage:UIImageView = UIImageView()
    var PasswordField:UITextField = UITextField()
    var HeaderButton:UIButton = UIButton()
    
    
    private var lionImage:UIImage = UIImage(named: "INGLion")!
    
    
    override init(frame: CGRect) {
       
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    @objc func ViewButtonTest()
    {
        print("Tap from BankView!")
    }
    func setupView() {
        

        HeaderLabel = UILabel()
        HeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        HeaderLabel.text = "Welcome!"
        HeaderLabel.textAlignment = .center
        HeaderLabel.numberOfLines = 0
        HeaderLabel.textColor = .black
        HeaderLabel.bounds = self.bounds
        
        CompanyImage = UIImageView(image:lionImage)
        CompanyImage.translatesAutoresizingMaskIntoConstraints = false


        
        LoginField = UITextField()
        LoginField.translatesAutoresizingMaskIntoConstraints = false
        LoginField.placeholder = "Enter Username"
        LoginField.textAlignment = .left
        LoginField.font = UIFont.systemFont(ofSize: 20)
        LoginField.backgroundColor = .white
        LoginField.isUserInteractionEnabled = false
        LoginField.borderStyle = .roundedRect
        LoginField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        LoginField.layer.borderWidth = 0.5
        LoginField.isUserInteractionEnabled = true


        PasswordField = UITextField()
        PasswordField.translatesAutoresizingMaskIntoConstraints = false
        PasswordField.placeholder = "Enter Password"
        PasswordField.textAlignment = .left
        PasswordField.font = UIFont.systemFont(ofSize: 22)
        PasswordField.isUserInteractionEnabled = false
        PasswordField.backgroundColor = .white
        PasswordField.borderStyle = .roundedRect
        PasswordField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        PasswordField.layer.borderWidth = 0.5
        PasswordField.isUserInteractionEnabled = true

       
        
        
        
        HeaderButton = UIButton()
        HeaderButton.backgroundColor = .systemBlue
        HeaderButton.setTitle("Log in", for:  UIControl.State.normal);
        HeaderButton.translatesAutoresizingMaskIntoConstraints = false
        HeaderButton.setTitle("Pressed", for: UIControl.State.highlighted)
        HeaderButton.addTarget(self, action: #selector(ViewButtonTest), for: .touchUpInside)
        

        addSubview(HeaderLabel);
        addSubview(LoginField)
        addSubview(PasswordField)
        addSubview(HeaderButton)
        addSubview(CompanyImage)
        
        SetupConstraints()
            

            // more constraints to be added here!
   
        
        
        func SetupConstraints()
        {
            NSLayoutConstraint.activate([
                HeaderLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                HeaderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                HeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                HeaderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                CompanyImage.topAnchor.constraint(equalTo: HeaderLabel.bottomAnchor, constant:0),
                CompanyImage.heightAnchor.constraint(equalToConstant: 250),
                CompanyImage.widthAnchor.constraint(equalTo: CompanyImage.heightAnchor, multiplier: lionImage.size.width / lionImage.size.height),
                CompanyImage.centerXAnchor.constraint(equalTo: HeaderLabel.centerXAnchor),
                LoginField.topAnchor.constraint(equalTo: CompanyImage.bottomAnchor, constant: 20),
                LoginField.centerXAnchor.constraint(equalTo: HeaderLabel.centerXAnchor),
                LoginField.widthAnchor.constraint(equalToConstant:300 ),
                PasswordField.topAnchor.constraint(equalTo: LoginField.bottomAnchor, constant: 10),
                PasswordField.centerXAnchor.constraint(equalTo: LoginField.centerXAnchor),
                PasswordField.widthAnchor.constraint(equalTo: LoginField.widthAnchor),
                PasswordField.heightAnchor.constraint(equalTo: LoginField.heightAnchor),
                HeaderButton.topAnchor.constraint(equalTo: PasswordField.bottomAnchor, constant: 40),
                HeaderButton.centerXAnchor.constraint(equalTo: PasswordField.centerXAnchor)
            ])
            
            NSLayoutConstraint.activate(
    [

    ])
        }
        
    
        
        
        
        
     
        }
    
  
    
    
 
}



#Preview {
    
    

    let loginView = UsernamePasswordLoginView()
    return loginView
}
