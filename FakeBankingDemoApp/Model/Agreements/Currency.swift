//
//  Currency.swift
//  FakeBankingDemoApp
//
//  Created by Schilperoort, L. (Lucas) on 26/11/2024.
//
import Foundation
import UIKit

public final class Currency: Codable, Sendable {

    public let Value: Double
    public var parsedValue: String { return Currency.parseMoneyValueToString(Value: Value) }
    public var attributedValue: NSAttributedString {
        return parseMoneyValueToAttributedString()
    }
    public let type: CurrencyType

    init(Value: String) {
        self.type = .Euro
        self.Value = Currency.parseMoneyValueToDouble(originalValue: Value)
    }
    
    init(Value: Double) {
        self.Value = Value
        self.type = .Euro
    }


    private func parseMoneyValueToAttributedString()
        -> NSMutableAttributedString
    {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.groupingSize = 3
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal

        let prefixString = NSMutableAttributedString(string: "EUR ")

        prefixString.addAttribute(
            NSMutableAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 16, weight: .ultraLight),
            range: NSRange.init(location: 0, length: prefixString.length))

        let attributedString = NSMutableAttributedString(
            string: formatter.string(
                from: NSNumber(value: self.Value)) ?? "")
        attributedString.addAttribute(
            NSMutableAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 16, weight: .semibold),
            range: NSRange.init(location: 0, length: attributedString.length))

        let combinedString = NSMutableAttributedString()
        combinedString.append(prefixString)
        combinedString.append(attributedString)

        return combinedString
    }

    public static func parseMoneyValueToString(Value:Double) -> String {

        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.groupingSize = 3
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal

        return "EUR " + (formatter.string(from: NSNumber(value: Value)) ?? "")

    }

    public static func parseMoneyValueToDouble(originalValue: String) -> Double {

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        var valueWithoutSymbol = originalValue.replacingCharacters(in: ...originalValue.startIndex, with: "")
        valueWithoutSymbol = valueWithoutSymbol.replacingOccurrences(
            of: ".", with: "")
        let number = formatter.number(from: valueWithoutSymbol)
        return number?.doubleValue ?? 0
    }

}

public enum CurrencyType: String, Codable, Sendable {
    case Dollar = "$"
    case Euro = "€"

}
