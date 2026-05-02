//
//  MarketListViewModelTests.swift
//  StockListTests
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import XCTest
@testable import StockList

final class MarketListViewModelTests: XCTestCase {
    @MainActor
    func testFilteredQuotesFiltersByNameAndSymbol() {
        let viewModel = MarketListViewModel()
        viewModel.setQuotes([
            StockQuote(symbol: "^GSPC", name: "S&P 500", price: 7230.12, change: 21.11, changePercent: 0.29),
            StockQuote(symbol: "^DJI", name: "Dow 30", price: 49499.27, change: -152.87, changePercent: -0.31)
        ])

        viewModel.searchText = "Dow"
        XCTAssertEqual(viewModel.filteredQuotes.map(\.symbol), ["^DJI"])

        viewModel.searchText = "^GSP"
        XCTAssertEqual(viewModel.filteredQuotes.map(\.symbol), ["^GSPC"])
    }
}
