//
//  AgreementModel.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 20/11/2024.
//

public protocol AgreementModel:Codable, Sendable{
    
    var identifier:ModelToCellMapper {get}
    
}
