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
    let open: Double?
    let previousClose: Double?
    let dayRange: String?
    let volume: Double?
    let averageVolume3Month: Double?
    let fiftyTwoWeekRange: String?
    let marketState: String
    let updatedAt: Date?
}
