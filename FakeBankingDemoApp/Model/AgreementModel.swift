//
//  AgreementModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 20/11/2024.
//

public protocol AgreementModel:Decodable{
    
    var identifier:String {get}
    
}





public final class TotalBalanceModel:AgreementModel{
    public private(set) var identifier: String
    
    
    public var totalBalance:Double
    
    init(accounts:[BankAccountModel]) {
        totalBalance = 0
        for account in accounts{
            totalBalance += account.balance
        }
        identifier = TotalBalanceViewCell.identifier
    }
    
    required public init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

struct AccountGroup:Decodable {
    var accountGroupType: String
    var accounts: [BankAccountModel]
}
 
struct BankAccountModel:Decodable, AgreementModel {
    var identifier: String = BankAccountCell.identifier
    var isActive: Bool
    var balance: Double
    var age: Int
    var accountHolderName: String
    var phone: String
    var accountNumber: String
    
    init(isActive: Bool, balance: Double, age: Int, accountHolderName: String, phone: String, accountNumber: String) {
        self.isActive = isActive
        self.balance = balance
        self.age = age
        self.accountHolderName = accountHolderName
        self.phone = phone
        self.accountNumber = accountNumber
    }
}
