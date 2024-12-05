//
//  Transaction.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 05/12/2024.
//

import Foundation

public struct Transaction:Codable {
    public var amount: Currency
    public var date: Date
    public var description: String
    
    init(date: Date, description: String, amount: Currency) {
        self.amount = amount
        self.date = date
        self.description = description
    }
}

public struct AccountTransactions:Codable {
    public var transactions: [Transaction]
    public var forIBAN: String
    
    init(transactions: [Transaction], forIBAN: String) {
        self.transactions = transactions
        self.forIBAN = forIBAN
    }
}



