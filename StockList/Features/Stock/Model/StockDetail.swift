//
//  StockDetail.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation

struct StockDetail: Equatable {
    let symbol: String
    let name: String
    let price: Double
    let change: Double
    let changePercent: Double
    let open: Double?
    let previousClose: Double?
    let dayRange: String?
    let volume: Double?
    let averageVolume3Month: Double?
    let fiftyTwoWeekRange: String?
    let marketState: String
    let updatedAt: Date?

    static func placeholder(symbol: String, name: String) -> StockDetail {
        StockDetail(
            symbol: symbol,
            name: name,
            price: 0,
            change: 0,
            changePercent: 0,
            open: nil,
            previousClose: nil,
            dayRange: nil,
            volume: nil,
            averageVolume3Month: nil,
            fiftyTwoWeekRange: nil,
            marketState: "-",
            updatedAt: nil
        )
    }
}
