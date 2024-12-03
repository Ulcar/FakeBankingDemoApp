//
//  Currency.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 26/11/2024.
//
import Foundation
public class Currency: Decodable {

    public var Value: Double
    public var parsedValue: String { return parseMoneyValueToString() }
    public var type: CurrencyType

    init(Value: String) {
        self.Value = 0
        self.type = .Euro
        self.Value = parseMoneyValueToDouble(originalValue: Value)
    }
    required public init(from decoder: any Decoder) throws {

        fatalError("init(from:) has not been implemented")
    }

    private func parseMoneyValueToString() -> String {

        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.groupingSize = 3
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal

        
        
        return "EUR " + (formatter.string(from: NSNumber(value: Value)) ?? "")

    }

    private func parseMoneyValueToDouble(originalValue: String) -> Double {

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        var valueWithoutSymbol = originalValue.replacingOccurrences(of: "\(type.rawValue)", with: "")
        valueWithoutSymbol = valueWithoutSymbol.replacingOccurrences(of: ".", with: "")
        let number = formatter.number(from: valueWithoutSymbol)
        return number?.doubleValue ?? 0
    }

}

public enum CurrencyType: String {
    case Dollar = "$"
    case Euro = "€"

}
