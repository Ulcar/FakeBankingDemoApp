//
//  AgreementViewModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

public class TransactionViewModel {

    private var service: TransactionServiceProtocol
    private(set) var transactions: [Transaction]
    public let IBAN:String

    init(IBAN:String, service: TransactionServiceProtocol) {
        transactions = []
        self.IBAN = IBAN
        self.service = service
        
    }

    var bindViewModelToController: (() -> Void) = {}

    public func FetchTransactions(observer: @escaping (() -> Void)) {
        bindViewModelToController = observer

        Task { @MainActor in
            do {
                transactions = try await service.GetTransactions(forIban: IBAN).transactions

                self.bindViewModelToController()
            } catch {
                // could add logic to viewController to handle exception from here?
                print("error: \(error)")

            }
        }
    }

}


