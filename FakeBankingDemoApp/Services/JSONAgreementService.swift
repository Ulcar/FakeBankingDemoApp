//
//  JSONAgreementService.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 26/11/2024.
//

import Foundation

public class JSONAgreementService: AgreementServiceProtocol {
    public func GetAgreements() -> [any AgreementModel] {
        let accountGroup:AccountGroup? = loadJson(filename: "Agreements")
        var agreements: [any AgreementModel] = []
        guard let accounts = accountGroup?.accounts else { return agreements }
        agreements.append(contentsOf: accounts)
        agreements.append(TotalBalanceModel(accounts: accounts))
        return agreements
        
    }
    
    
    private func loadJson(filename fileName: String) -> AccountGroup? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(AccountGroup.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    
    
    // modified from https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
    private func loadJson<T>(filename fileName: String) -> T? where T:Decodable{
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    
}
