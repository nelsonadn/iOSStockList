//
//  MarketDetailViewModel.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation
import Combine

@MainActor
final class StockDetailViewModel: ObservableObject {
    @Published private(set) var detail: StockDetail?
    @Published private(set) var isLoading = false

    func loadDetail(symbol: String, fallbackName: String) async {
        isLoading = true
        guard let url = APIEndpoint.stockSummary(symbol: symbol).url else {
            isLoading = false
            self.detail = .placeholder(symbol: symbol, name: fallbackName)
            return
        }

        let apiClient = APIClient()

        do {
            let data = try await apiClient.fetchData(
                from: url,
                headers: [
                    "Content-Type": "application/json",
                    "x-rapidapi-host": Constants.apiHost,
                    "x-rapidapi-key": Constants.apiKey
                ]
            )

            let response = try JSONDecoder().decode(StockDetailDataTransferObject.self, from: data)
            self.detail = Self.map(response: response, symbol: symbol, fallbackName: fallbackName)
        } catch {
            print("Stock detail error: \(error)")
            self.detail = .placeholder(symbol: symbol, name: fallbackName)
        }

        isLoading = false
    }

    nonisolated static func map(
        response: StockDetailDataTransferObject,
        symbol: String,
        fallbackName: String
    ) -> StockDetail {
        let price = response.price?.regularMarketPrice ?? 0
        let change = response.price?.regularMarketChange ?? 0
        let changePercent = response.price?.regularMarketChangePercent ?? 0
        let name = response.price?.shortName ?? response.price?.longName ?? fallbackName
        let marketState = response.price?.marketState ?? "-"
        let updatedAt = response.price?.regularMarketTime.map { Date(timeIntervalSince1970: TimeInterval($0)) }
        let summary = response.summaryDetail

        let dayRange = Formatters.range(
            min: response.price?.regularMarketDayLow ?? summary?.dayLow,
            max: response.price?.regularMarketDayHigh ?? summary?.dayHigh
        )
        let fiftyTwoWeekRange = Formatters.range(
            min: summary?.fiftyTwoWeekLow,
            max: summary?.fiftyTwoWeekHigh
        )

        return StockDetail(
            symbol: symbol,
            name: name,
            price: price,
            change: change,
            changePercent: changePercent,
            open: response.price?.regularMarketOpen ?? summary?.open,
            previousClose: response.price?.regularMarketPreviousClose ?? summary?.previousClose,
            dayRange: dayRange,
            volume: response.price?.regularMarketVolume ?? summary?.volume,
            averageVolume3Month: response.price?.averageDailyVolume3Month ?? summary?.averageVolume3Month,
            fiftyTwoWeekRange: fiftyTwoWeekRange,
            marketState: marketState,
            updatedAt: updatedAt
        )
    }
}
