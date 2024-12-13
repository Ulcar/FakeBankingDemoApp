//
//  AgreementService.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

import Foundation

public class FakeUserAPIAgreementService: AgreementServiceProtocol {
    public func GetAgreements() async throws -> [AccountGroupModel] {

        var accountGroups: [AccountGroup] = []

        var accounts: [BankAccountModel] = []
        for _ in 0..<Int.random(in: 1..<10) {
            let fakeUser = GetMockUser()
            accounts.append(
                BankAccountModel(
                    isActive: true,
                    balance: String(Double.random(in: 1..<1_000_000)),
                    accountHolderName: fakeUser.name.first, phone: "0650999252",
                    accountNumber: GenerateMockIBAN()))
        }
        accountGroups.append(
            AccountGroup(accountGroupType: "BankRekening", accounts: accounts))

        var accountGroupModels: [AccountGroupModel] = []

        for accountGroup in accountGroups {

        }

        return accountGroupModels
    }

    public func AgreementsToJSON() -> String {
        var Agreements = GetAgreements()

        // how to go from accountgroup back to Json?

        return ""
    }

    public func GetAgreements() -> [AgreementModel] {

        var accounts: [BankAccountModel] = []
        for _ in 0..<Int.random(in: 1..<10) {
            let fakeUser = GetMockUser()
            accounts.append(
                BankAccountModel(
                    isActive: true,
                    balance: String(Double.random(in: 1..<1_000_000)),
                    accountHolderName: fakeUser.name.first, phone: "0650999252",
                    accountNumber: GenerateMockIBAN()))
        }
        var returnValue: [AgreementModel] = accounts

        return returnValue
    }

    private func GenerateMockIBAN() -> String {

        let IBAN =
            "NL84 INGB \(Int.random(in: 0..<9))\(Int.random(in: 0..<9))\(Int.random(in: 0..<9))\(Int.random(in: 0..<9)) \(Int.random(in: 0..<9))\(Int.random(in: 0..<9))\(Int.random(in: 0..<9))\(Int.random(in: 0..<9)) \(Int.random(in: 0..<9))\(Int.random(in: 0..<9)):"

        return IBAN

    }

    private func GetMockUser() -> FakeUser {

        var returnValue: FakeUser = FakeUser(
            name: FullName(first: "Invaild", last: "Call"))

        // Define the URL you want to request
        let apiUrlStr = "https://randomuser.me//api"

        // Create a URL object from the string
        if let apiUrl = URL(string: apiUrlStr) {

            var URLRequest = URLRequest(url: apiUrl)

            URLRequest.httpMethod = "GET"

            URLRequest.url?.append(queryItems: [
                URLQueryItem(name: "inc", value: "name")
            ])
            let dataTask = URLSession.shared.dataTask(with: URLRequest) {
                data, response, error in

                // Check if data is available
                guard let responseData = data else {
                    print("No data received")
                    return
                }

                if let jsonString = String(data: responseData, encoding: .utf8)
                {
                    print(jsonString)
                    // parse this json string
                    let json = try! JSONSerialization.jsonObject(
                        with: responseData, options: [])
                    //why does it have to be this annoying!!!!!
                    if let jsonResults = json as? [String: Any] {
                        let results = jsonResults["results"]
                        let resultsData = try! JSONSerialization.data(
                            withJSONObject: results!)
                        returnValue = try! JSONDecoder().decode(
                            [FakeUser].self, from: resultsData)[0]

                    }

                }

            }

            dataTask.resume()

        }

        return returnValue
    }

    class FakeUser: Decodable {
        public var name: FullName

        init(name: FullName) {
            self.name = name
        }

    }

    class FullName: Decodable {
        public let first: String
        public let last: String

        init(first: String, last: String) {
            self.first = first
            self.last = last
        }

    }

}
