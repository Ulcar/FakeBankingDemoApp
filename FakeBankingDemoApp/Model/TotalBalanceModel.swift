//
//  TotalBalanceModel.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 28/11/2024.
//

public final class TotalBalanceModel:AgreementModel{
    public private(set) var identifier: ModelToCellMapper = .TotalBalance
    
    
    public var totalBalance:Double
    
    init(accounts:[BankAccountModel]) {
        totalBalance = 0
        for account in accounts{
            totalBalance += account.convertedCurrency.Value
        }
    }
    
    required public init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
