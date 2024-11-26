//
//  AgreementModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 20/11/2024.
//

public protocol AgreementModel:Decodable{
    
    var identifier:String {get}
    
}



public final class BankAccountModel:AgreementModel{
    public private(set) var identifier: String
    
    public var IBAN:String
    public var NameCustomer:String
    public var balance:Double
    
    init(IBAN: String, NameCustomer:String, balance:Double) {
        self.IBAN = IBAN
        self.NameCustomer = NameCustomer
        self.balance = balance
        identifier = BankAccountCell.identifier
    }
    
    required public init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    
}


public final class TotalBalanceModel:AgreementModel{
    public private(set) var identifier: String
    
    
    public var totalBalance:Double
    
    init(totalBalance: Double) {
        self.totalBalance = totalBalance
        identifier = TotalBalanceViewCell.identifier
    }
    
    required public init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
