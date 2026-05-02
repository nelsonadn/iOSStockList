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
    @Published private(set) var isLoading = false

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

    func loadQuotes() async {
        guard let url = APIEndpoint.marketSummary.url else { return }
        let apiClient = APIClient()
        isLoading = true

        do {
            let data = try await apiClient.fetchData(
                from: url,
                headers: [
                    "Content-Type": "application/json",
                    "x-rapidapi-host": Constants.apiHost,
                    "x-rapidapi-key": Constants.apiKey
                ]
            )

            if let rawJSON = String(data: data, encoding: .utf8) {
                print("Market summary raw response:")
                print(rawJSON)
            }

            let response = try JSONDecoder().decode(MarketSummaryDataTransferObject.self, from: data)
            print("Market summary decoded response:")
            print(response)

            quotes = response.marketSummaryResponse.result.compactMap { item in
                guard let price = item.regularMarketPrice?.raw,
                      let change = item.regularMarketChange?.raw else { return nil }

                return StockQuote(
                    symbol: item.symbol,
                    name: item.shortName ?? item.longName ?? item.symbol,
                    price: price,
                    change: change
                )
            }
        } catch {
            print("Market summary error: \(error)")
            quotes = []
        }

        isLoading = false
    }
}
