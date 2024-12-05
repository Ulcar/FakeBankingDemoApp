//
//  BankAccountModel.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 28/11/2024.
//
import Foundation
public struct AccountGroup:Codable {
    let accountGroupType: String
    let accounts: [BankAccountModel]
}
 
public struct AccountGroupModel:Sendable {
    let accountGroupType:String
    let accounts: [AgreementModel]
}


public struct BankAccountModel:Codable, AgreementModel {
    public var identifier: ModelToCellMapper  {return .AccountWithIcon}
    let isActive: Bool
    let iconToLoad:String?
    let balance: String
    let accountHolderName: String
    let phone: String
    let accountNumber: String
    let convertedCurrency:Currency

    
    private enum CodingKeys: String, CodingKey {
        case isActive
        case iconToLoad
        case balance
        case accountHolderName
        case phone
        case accountNumber
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.iconToLoad = try container.decodeIfPresent(String.self, forKey: .iconToLoad)
        self.balance = try container.decode(String.self, forKey: .balance)
        self.accountHolderName = try container.decode(String.self, forKey: .accountHolderName)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.accountNumber = try container.decode(String.self, forKey: .accountNumber)
        self.convertedCurrency = Currency(Value: balance)
    }
    init(isActive: Bool, balance: String, accountHolderName: String, phone: String, accountNumber: String, iconToLoad:String? = nil) {
        self.isActive = isActive
        self.balance = balance
        self.accountHolderName = accountHolderName
        self.phone = phone
        self.accountNumber = accountNumber
        self.iconToLoad = iconToLoad
        self.convertedCurrency = Currency(Value: balance)
    }
    
}
