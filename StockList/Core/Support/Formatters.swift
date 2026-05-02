//
//  Formatters.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation

enum Formatters {
    static func currency(_ value: Double?) -> String {
        guard let value else { return "-" }
        return value.formatted(.number.precision(.fractionLength(2)))
    }

    static func percent(_ value: Double?) -> String {
        guard let value else { return "-" }
        return value.formatted(.number.precision(.fractionLength(2))) + "%"
    }
}
