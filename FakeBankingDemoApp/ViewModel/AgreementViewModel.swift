//
//  AgreementViewModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 21/11/2024.
//

 public class AgreementViewModel{
    
     private var service:AgreementServiceProtocol = JSONAgreementService()
     private(set) var Agreements: [AccountGroup] {
         didSet {
             self.bindViewModelToController()
         }
     }
     
     init() {
         Agreements = []
     }
     
     var bindViewModelToController : (() -> ()) = {}

     
     public func FetchAgreements(observer: @escaping (() -> ())) {
         bindViewModelToController = observer
         
         Task { @MainActor in
                     do {
                         Agreements = await service.GetAgreements()
                     } catch {
                         // .. handle error
                       }
        }
     }
     
     
     
     
    
    
}
