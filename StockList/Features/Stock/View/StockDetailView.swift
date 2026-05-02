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
        ZStack {
            Theme.Colors.background.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: Theme.Spacing.lg) {
                    header

                    if let detail = viewModel.detail {
                        StockMetricCardView {
                            StockMetricRowView(title: "Price", value: Formatters.currency(detail.price), isPositive: nil)
                            Divider()
                            StockMetricRowView(
                                title: "Change",
                                value: "\(Formatters.change(detail.change)) \(Formatters.percent(detail.changePercent))",
                                isPositive: detail.change >= 0
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
                .padding(.horizontal, Theme.Spacing.md)
                .padding(.top, 24)
                .padding(.bottom, Theme.Spacing.lg)
            }
        }
        .task {
            await viewModel.loadDetail(symbol: detail.symbol, fallbackName: detail.name)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
            Text(viewModel.detail?.name ?? detail.name)
                .font(.custom("Avenir Next", size: 42).weight(.bold))
                .foregroundStyle(Theme.Colors.primaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
            Text(viewModel.detail?.symbol ?? detail.symbol)
                .font(Theme.Fonts.subtitle)
                .foregroundStyle(Theme.Colors.secondaryText)
        }
    }
}
