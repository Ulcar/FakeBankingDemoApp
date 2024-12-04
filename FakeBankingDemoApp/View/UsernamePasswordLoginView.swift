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
    var headerLabel:UILabel = UILabel()
    var loginField:UITextField = UITextField()
    var companyImage:UIImageView = UIImageView()
    var passwordField:UITextField = UITextField()
    var loginButton:UIButton = UIButton()
    var invaildPasswordLabel:UILabel = UILabel()
    var lionImage:UIImage = UIImage(named: "Bankieren")!
    
    
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
        

        headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Welcome!"
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 0
        headerLabel.textColor = .black
        
        companyImage = UIImageView(image:lionImage)
        companyImage.translatesAutoresizingMaskIntoConstraints = false

        loginField = UITextField()
        loginField.translatesAutoresizingMaskIntoConstraints = false
        loginField.placeholder = "Enter Username"
        loginField.textAlignment = .left
        loginField.font = UIFont.systemFont(ofSize: 20)
        loginField.backgroundColor = .white
        loginField.isUserInteractionEnabled = false
        loginField.borderStyle = .roundedRect
        loginField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        loginField.layer.borderWidth = 0.5
        loginField.isUserInteractionEnabled = true
        
        passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Enter Password"
        passwordField.textAlignment = .left
        passwordField.font = UIFont.systemFont(ofSize: 22)
        passwordField.isUserInteractionEnabled = false
        passwordField.backgroundColor = .white
        passwordField.borderStyle = .roundedRect
        passwordField.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        passwordField.layer.borderWidth = 0.5
        passwordField.isUserInteractionEnabled = true
        passwordField.isSecureTextEntry = true
        passwordField.enablesReturnKeyAutomatically = true
        
        loginButton = UIButton()
        loginButton.backgroundColor = .systemGray3
        loginButton.setTitle("Log in", for:  UIControl.State.normal);
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Loading", for: UIControl.State.highlighted)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(ViewButtonTest), for: .touchUpInside)
        loginButton.isUserInteractionEnabled = false
        
        invaildPasswordLabel.textColor = .red
        invaildPasswordLabel.isEnabled = false
        invaildPasswordLabel.text = "Invaild Username or Password"
        invaildPasswordLabel.textAlignment = .center

        addSubview(headerLabel);
        addSubview(loginField)
        addSubview(passwordField)
        addSubview(loginButton)
        addSubview(companyImage)
        addSubview(invaildPasswordLabel)

        SetupConstraints()
        
        func SetupConstraints()
        {
            NSLayoutConstraint.activate([
                headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                companyImage.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant:0),
                companyImage.heightAnchor.constraint(equalToConstant: 128),
                companyImage.widthAnchor.constraint(equalTo: companyImage.heightAnchor, multiplier: lionImage.size.width / lionImage.size.height),
                companyImage.centerXAnchor.constraint(equalTo: headerLabel.centerXAnchor),
                loginField.topAnchor.constraint(equalTo: companyImage.bottomAnchor, constant: 20),
                loginField.centerXAnchor.constraint(equalTo: headerLabel.centerXAnchor),
                loginField.widthAnchor.constraint(equalToConstant:300 ),
                passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 10),
                passwordField.centerXAnchor.constraint(equalTo: loginField.centerXAnchor),
                passwordField.widthAnchor.constraint(equalTo: loginField.widthAnchor),
                passwordField.heightAnchor.constraint(equalTo: loginField.heightAnchor),
                loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
                loginButton.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor),
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
