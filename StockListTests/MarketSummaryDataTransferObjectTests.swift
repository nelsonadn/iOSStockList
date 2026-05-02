//
//  MarketSummaryDataTransferObjectTests.swift
//  StockListTests
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import XCTest
@testable import StockList

final class MarketSummaryDataTransferObjectTests: XCTestCase {
    func testDecodesMarketSummaryRawValues() throws {
        let json = """
        {
          "marketSummaryResponse": {
            "result": [
              {
                "symbol": "^GSPC",
                "shortName": "S&P 500",
                "regularMarketPrice": { "raw": 7230.12 },
                "regularMarketChange": { "raw": 21.11 },
                "regularMarketChangePercent": { "raw": 0.29 }
              }
            ]
          }
        }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(MarketSummaryDataTransferObject.self, from: json)
        let item = try XCTUnwrap(decoded.marketSummaryResponse.result.first)

        XCTAssertEqual(item.symbol, "^GSPC")
        XCTAssertEqual(item.shortName, "S&P 500")
        XCTAssertEqual(item.regularMarketPrice?.raw, 7230.12)
        XCTAssertEqual(item.regularMarketChange?.raw, 21.11)
        XCTAssertEqual(item.regularMarketChangePercent?.raw, 0.29)
    }
}
