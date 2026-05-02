//
//  MarketDetailView.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI

struct StockDetailView: View {
    @StateObject private var viewModel = StockDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Theme.Spacing.lg) {
                Text("Details")
                    .font(Theme.Fonts.title)

                if let detail = viewModel.detail {
                    VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                        Text(detail.name)
                            .font(.title.bold())
                        Text(detail.symbol)
                            .foregroundStyle(Theme.Colors.secondaryText)
                    }

                    StockMetricCardView {
                        metricRow("Price", Formatters.currency(detail.price))
                        metricRow("Change", Formatters.change(detail.change))
                        metricRow("Open", Formatters.currency(detail.open))
                        metricRow("Previous Close", Formatters.currency(detail.previousClose))
                        metricRow("Day Range", Formatters.textRange(detail.dayRange))
                        metricRow("Volume", Formatters.currency(detail.volume))
                        metricRow("Avg Volume (3M)", Formatters.currency(detail.averageVolume3Month))
                        metricRow("52 Week Range", Formatters.textRange(detail.fiftyTwoWeekRange))
                        metricRow("Market State", detail.marketState)
                        metricRow("Updated", Formatters.time(detail.updatedAt))
                    }
                } else {
                    LoadingView()
                }
            }
            .padding()
        }
    }

    private func metricRow(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .font(Theme.Fonts.body)
    }
}
