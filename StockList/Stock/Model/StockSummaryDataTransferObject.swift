//
//  StockSummaryDataTransferObject.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation

struct StockSummaryDataTransferObject: Decodable {
    let symbol: String
    let shortName: String?
    let longName: String?
    let regularMarketPrice: Double?
    let regularMarketChange: Double?
    let regularMarketOpen: Double?
    let regularMarketPreviousClose: Double?
    let regularMarketDayHigh: Double?
    let regularMarketDayLow: Double?
    let regularMarketVolume: Double?
    let averageDailyVolume3Month: Double?
    let fiftyTwoWeekHigh: Double?
    let fiftyTwoWeekLow: Double?
    let marketState: String?
    let regularMarketTime: Date?
}
