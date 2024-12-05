import Foundation
import UIKit

var greeting = "Hello, playground"

Task {

    let service = JSONAgreementService()
    let users: [AccountGroupModel] = try! await service.GetAgreements()
    var allTransactions: [AccountTransactions] = []

    for user in users {
        for account in user.accounts {

            if account.identifier == .AccountWithIcon {
                let accountModel = account as! BankAccountModel

                var transactions: AccountTransactions = AccountTransactions(
                    transactions: [], forIBAN: accountModel.accountNumber)

                for index in 0..<Int.random(in: 1...100) {
                    let randomDouble = Double.random(in: 1...100000)
                    let roundedDouble = Double(round(100 * randomDouble) / 100)
                    let currency = Currency(Value: roundedDouble)
                    transactions.transactions.append(
                        Transaction(
                            date: Date.randomBetween(
                                start: Date(
                                    timeIntervalSince1970: 1_704_106_800),
                                end: Date(timeIntervalSince1970: 1_735_642_800)),
                            description: "Test transaction",
                            amount: currency
                        ))
                }
                allTransactions.append(transactions)
            }

        }
    }

    let jsonEncoder = JSONEncoder()
    let jsonResultData = try jsonEncoder.encode(allTransactions)
    let jsonResultString = String(data: jsonResultData, encoding: .utf8)!
    print(jsonResultString)

    // checking if it still decodes too

    let jsonDecoder = JSONDecoder()
    let jsonDecodedResult = try jsonDecoder.decode(
        [AccountTransactions].self, from: jsonResultData)

}
