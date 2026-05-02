//
//  MarketDetailView.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI

struct StockDetailView: View {
    let detail: StockDetail
    @StateObject private var viewModel = StockDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Theme.Spacing.lg) {
                HStack {
                    Spacer()
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }

                header

                if let detail = viewModel.detail {
                    StockMetricCardView {
                        StockMetricRowView(title: "Price", value: Formatters.currency(detail.price))
                        Divider()
                        StockMetricRowView(
                            title: "Change",
                            value: Formatters.change(detail.change)
                        )
                    }

                    StockMetricCardView {
                        StockMetricRowView(title: "Open", value: Formatters.currency(detail.open))
                        Divider()
                        StockMetricRowView(title: "Previous Close", value: Formatters.currency(detail.previousClose))
                        Divider()
                        StockMetricRowView(title: "Day Range", value: Formatters.textRange(detail.dayRange))
                        Divider()
                        StockMetricRowView(title: "Volume", value: Formatters.currency(detail.volume))
                        Divider()
                        StockMetricRowView(title: "Average Volume (3M)", value: Formatters.currency(detail.averageVolume3Month))
                        Divider()
                        StockMetricRowView(title: "52 Week Range", value: Formatters.textRange(detail.fiftyTwoWeekRange))
                        Divider()
                        StockMetricRowView(title: "Market State", value: detail.marketState)
                        Divider()
                        StockMetricRowView(title: "Last Updated", value: Formatters.time(detail.updatedAt))
                    }
                } else {
                    LoadingView()
                }
            }
            .padding()
        }
        .task {
            viewModel.setDetail(detail)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
            Text("Details")
                .font(Theme.Fonts.title)
            Text(viewModel.detail?.name ?? detail.name)
                .font(.largeTitle.bold())
                .foregroundStyle(Theme.Colors.primaryText)
            Text(viewModel.detail?.symbol ?? detail.symbol)
                .font(Theme.Fonts.subtitle)
                .foregroundStyle(Theme.Colors.secondaryText)
        }
    }
}
