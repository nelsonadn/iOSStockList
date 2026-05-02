//
//  MarketListViewModel.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation
import Combine

@MainActor
final class MarketListViewModel: ObservableObject {
    @Published private(set) var quotes: [StockQuote] = []
    @Published var searchText: String = ""

    var filteredQuotes: [StockQuote] {
        guard !searchText.isEmpty else { return quotes }
        return quotes.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.symbol.localizedCaseInsensitiveContains(searchText)
        }
    }

    func setQuotes(_ quotes: [StockQuote]) {
        self.quotes = quotes
    }
}
