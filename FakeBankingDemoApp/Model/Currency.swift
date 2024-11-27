//
//  Currency.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 26/11/2024.
//


public class Currency:Decodable {
    
    public var Value:Double
    public var parsedValue:String {get {return parseMoneyValueToString()}}
    public var type:CurrencyType
    
    init(Value: Double, type: CurrencyType) {
        self.Value = Value
        self.type = type
    }
    
    
    required public init(from decoder: any Decoder) throws {
        
        
       
        
        
        fatalError("init(from:) has not been implemented")
    }
    
    
    private func parseMoneyValueToString() -> String {
        
        return type.rawValue + String(format: "%.01f", Value)

    }
    
}


public enum CurrencyType:String
{
    case Dollar = "$"
    case Euro = "€"
    
}
