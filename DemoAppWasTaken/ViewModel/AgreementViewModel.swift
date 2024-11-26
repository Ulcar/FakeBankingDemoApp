//
//  AgreementViewModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

 public class AgreementViewModel{
    
    //we can refactor this to inject any AgreementServiceProtocol when creating the view model
    private var service:AgreementServiceProtocol = MockAgreementService()
    //getter function does the API call to the service
    public var Agreements:[AgreementModel] {get {return service.GetAgreements()}}
     
     
     public func GetAgreements() -> [AgreementModel] {
         return service.GetAgreements()
     }
    
    
}
