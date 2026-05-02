//
//  StockDetailViewModelTests.swift
//  StockListTests
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import XCTest
@testable import StockList

final class StockDetailViewModelTests: XCTestCase {
    func testMapBuildsMinimalStockDetail() {
        let response = StockDetailDataTransferObject(
            summaryDetail: StockSummaryDetailDataTransferObject(
                previousClose: 7209.01,
                open: 7234.54,
                dayLow: 7229.32,
                dayHigh: 7272.52,
                volume: 2_918_281_000,
                averageVolume3Month: 5_605_163_709,
                fiftyTwoWeekLow: 5578.64,
                fiftyTwoWeekHigh: 7272.52
            ),
            price: StockPriceDataTransferObject(
                regularMarketChangePercent: 0.29,
                regularMarketChange: 21.11,
                regularMarketTime: 1_777_669_643,
                regularMarketPrice: 7230.12,
                regularMarketDayHigh: 7272.52,
                regularMarketDayLow: 7229.32,
                regularMarketVolume: 2_918_281_000,
                averageDailyVolume3Month: 5_605_163_709,
                regularMarketPreviousClose: 7209.01,
                regularMarketOpen: 7234.54,
                marketState: "CLOSED",
                shortName: "S&P 500",
                longName: "S&P 500"
            ),
            quoteType: .init(shortName: "S&P 500", longName: "S&P 500"),
            symbol: "^GSPC"
        )

        let detail = StockDetailViewModel.map(response: response, symbol: "^GSPC", fallbackName: "Fallback")

        XCTAssertEqual(detail.symbol, "^GSPC")
        XCTAssertEqual(detail.name, "S&P 500")
        XCTAssertEqual(detail.price, 7230.12)
        XCTAssertEqual(detail.change, 21.11)
        XCTAssertEqual(detail.changePercent, 0.29)
        XCTAssertEqual(detail.open, 7234.54)
        XCTAssertEqual(detail.previousClose, 7209.01)
        XCTAssertEqual(detail.dayRange, "7229.32 - 7272.52")
        XCTAssertEqual(detail.volume, 2_918_281_000)
        XCTAssertEqual(detail.averageVolume3Month, 5_605_163_709)
        XCTAssertEqual(detail.fiftyTwoWeekRange, "5578.64 - 7272.52")
        XCTAssertEqual(detail.marketState, "CLOSED")
        XCTAssertEqual(detail.updatedAt, Date(timeIntervalSince1970: 1_777_669_643))
    }
}
