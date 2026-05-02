//
//  APIEndpoint.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation

enum APIEndpoint {
    case marketSummary
    case stockSummary(symbol: String)

    var path: String {
        switch self {
        case .marketSummary:
            return "/market/get-summary"
        case .stockSummary:
            return "/stock/get-summary"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .marketSummary:
            return [URLQueryItem(name: "region", value: "US")]
        case .stockSummary(let symbol):
            return [
                URLQueryItem(name: "lang", value: "en-US"),
                URLQueryItem(name: "symbol", value: symbol),
                URLQueryItem(name: "region", value: "US")
            ]
        }
    }
}
