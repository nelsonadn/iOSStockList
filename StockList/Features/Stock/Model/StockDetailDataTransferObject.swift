//
//  StockDetailDataTransferObject.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation

struct StockDetailDataTransferObject: Decodable {
    let summaryDetail: StockSummaryDetailDataTransferObject?
    let price: StockPriceDataTransferObject?
    let quoteType: StockQuoteTypeDataTransferObject?
    let symbol: String?
}

struct StockSummaryDetailDataTransferObject: Decodable {
    let previousClose: Double?
    let open: Double?
    let dayLow: Double?
    let dayHigh: Double?
    let volume: Double?
    let averageVolume3Month: Double?
    let fiftyTwoWeekLow: Double?
    let fiftyTwoWeekHigh: Double?
}

struct StockPriceDataTransferObject: Decodable {
    let regularMarketChangePercent: Double?
    let regularMarketChange: Double?
    let regularMarketTime: Int?
    let regularMarketPrice: Double?
    let regularMarketDayHigh: Double?
    let regularMarketDayLow: Double?
    let regularMarketVolume: Double?
    let averageDailyVolume3Month: Double?
    let regularMarketPreviousClose: Double?
    let regularMarketOpen: Double?
    let marketState: String?
    let shortName: String?
    let longName: String?
}

struct StockQuoteTypeDataTransferObject: Decodable {
    let shortName: String?
    let longName: String?
}
