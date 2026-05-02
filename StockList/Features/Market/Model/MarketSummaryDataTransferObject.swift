//
//  MarketSummaryDataTransferObject.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation

struct MarketSummaryDataTransferObject: Decodable {
    let marketSummaryResponse: MarketSummaryResponse
}

struct MarketSummaryResponse: Decodable {
    let result: [MarketSummaryItemDataTransferObject]
}

struct MarketSummaryItemDataTransferObject: Decodable {
    let symbol: String
    let shortName: String?
    let longName: String?
    let regularMarketPrice: Double?
    let regularMarketChange: Double?
}
