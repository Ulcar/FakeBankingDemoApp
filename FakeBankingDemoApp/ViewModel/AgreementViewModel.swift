//
//  AgreementViewModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

public class AgreementViewModel {

    private var service: AgreementServiceProtocol = JSONAgreementService()
    private(set) var agreements: [AccountGroupModel]

    init() {
        agreements = []
    }

    var bindViewModelToController: (() -> Void) = {}

    public func FetchAgreements(observer: @escaping (() -> Void)) {
        bindViewModelToController = observer

        Task { @MainActor in
            do {
                agreements = try await service.GetAgreements()

                self.bindViewModelToController()
            } catch {
                // could add logic to viewController to handle exception from here?
                print("error: \(error)")

            }
        }
    }

}

public struct ConvertedAccountGroup {
    public var accountGroup: AccountGroup
    public var addedModels: [AgreementModel]
}
