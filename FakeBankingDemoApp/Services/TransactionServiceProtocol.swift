//
//  AgreementServiceProtocol.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

public protocol TransactionServiceProtocol {
    func GetTransactions(forIban:String) async throws -> AccountTransactions

}
