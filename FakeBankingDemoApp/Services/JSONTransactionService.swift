//
//  JSONAgreementService.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 26/11/2024.
//

import Foundation

public class JSONTransactionService: TransactionServiceProtocol {
    public func GetTransactions(forIban:String) async throws -> AccountTransactions {
        let accountTransactions: [AccountTransactions]? = try loadJson(
            filename: "Transactions")
        
        return accountTransactions?[0] ?? AccountTransactions(transactions: [], forIBAN: "")

        
    }

    
    //     modified from https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
    private func loadJson<T>(filename fileName: String) throws -> T where T:Decodable{
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            }
        }
        throw JSONParsingError.invaildInput
    }
    
    private func saveJson(fileName:String, json:String){
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                
                
            }
            
        }
        
    }
    
}



