//
//  BankAccountModel.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 28/11/2024.
//

public struct BankAccountModel:Decodable, AgreementModel {
    public var identifier: String = BankAccountCell.identifier
    var isActive: Bool
    var balance: String
    var accountHolderName: String
    var phone: String
    var accountNumber: String
    
    private enum CodingKeys: String, CodingKey {
        case isActive
        case balance
        case accountHolderName
        case phone
        case accountNumber
    }
    
    
    init(isActive: Bool, balance: String, accountHolderName: String, phone: String, accountNumber: String) {
        self.isActive = isActive
        self.balance = balance
        self.accountHolderName = accountHolderName
        self.phone = phone
        self.accountNumber = accountNumber
    }
}
