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
//        for account in accounts{
//            totalBalance += account.balance
//        }
        identifier = TotalBalanceViewCell.identifier
    }
    
    required public init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

public struct AccountGroup:Decodable {
    var accountGroupType: String
    var accounts: [BankAccountModel]
}
 

