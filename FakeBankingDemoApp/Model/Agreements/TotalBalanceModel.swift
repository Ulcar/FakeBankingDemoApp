//
//  TotalBalanceModel.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 28/11/2024.
//

public final class TotalBalanceModel:AgreementModel{
    public private(set) var identifier: ModelToCellMapper = .TotalBalance
    
    
    public var totalBalance:Currency
    
    init(accounts:[BankAccountModel]) {
        var balance:Double = 0
        for account in accounts{
            balance += account.convertedCurrency.Value
        }
        
        totalBalance = Currency(Value: balance)
    }
    
    required public init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
