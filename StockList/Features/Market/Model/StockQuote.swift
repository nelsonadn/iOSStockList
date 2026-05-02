//
//  StockQuote.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation

struct StockQuote: Identifiable, Equatable {
    let symbol: String
    let name: String
    let price: Double
    let change: Double
    let changePercent: Double

    var id: String { symbol }
}
