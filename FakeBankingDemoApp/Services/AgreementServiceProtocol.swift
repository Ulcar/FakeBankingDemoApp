//
//  AgreementServiceProtocol.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

public protocol AgreementServiceProtocol {
    func GetAgreements() async throws -> [AccountGroupModel]

}
