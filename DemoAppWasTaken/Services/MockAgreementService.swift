//
//  AgreementService.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

public class MockAgreementService:AgreementServiceProtocol{
    
    public func GetAgreements() -> [AgreementModel]{
        
        var returnValue:[AgreementModel] = []
        
        // mock data for now, usually this would come from some kind of back-end
        
        returnValue.append(BankAccountModel(IBAN: "Test IBAN", NameCustomer: "Lucas Schilperoort"))
        
        return returnValue
    }
    
    
}
