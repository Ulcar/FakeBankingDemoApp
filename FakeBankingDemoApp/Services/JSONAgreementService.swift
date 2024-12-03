//
//  JSONAgreementService.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 26/11/2024.
//

import Foundation

public class JSONAgreementService: AgreementServiceProtocol {
    public func GetAgreements() async throws -> [AccountGroupModel] {
        let accountGroups: [AccountGroup]? = try loadJson(
            filename: "Agreements")
        var accountGroupModels: [AccountGroupModel]? = []
        for accountGroup in accountGroups! {

            var agreementModels: [AgreementModel] = []
            agreementModels.append(contentsOf: accountGroup.accounts)
            agreementModels.append(
                TotalBalanceModel(accounts: accountGroup.accounts))
            accountGroupModels?.append(
                AccountGroupModel(
                    accountGroupType: accountGroup.accountGroupType,
                    accounts: agreementModels))
        }
        return accountGroupModels ?? []

    }

    private func loadJson(filename fileName: String) throws -> [AccountGroup] {
        if let url = Bundle.main.url(
            forResource: fileName, withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(
                    [AccountGroup].self, from: data)
                return jsonData
            }
        }
        return []
    }

    //     modified from https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
    //    private func loadJson<T>(filename fileName: String) -> T where T:Decodable{
    //        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
    //            do {
    //                let data = try Data(contentsOf: url)
    //                let decoder = JSONDecoder()
    //                let jsonData = try decoder.decode(T.self, from: data)
    //                return jsonData
    //            } catch {
    //                print("error:\(error)")
    //            }
    //        }
    //        return nil
    //    }

}
