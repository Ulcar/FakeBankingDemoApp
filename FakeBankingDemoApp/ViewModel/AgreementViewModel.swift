//
//  AgreementViewModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

 public class AgreementViewModel{
    
     private var service:AgreementServiceProtocol = JSONAgreementService()
     
     
     private var resource:String = "Agreements"
     
     public func GetAgreements() -> [AgreementModel] {
         return service.GetAgreements()
     }
    
    
}
