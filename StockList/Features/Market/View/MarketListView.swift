//
//  MarketListView.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI
import UIKit

struct MarketListView: View {
    @StateObject private var viewModel = MarketListViewModel()
    @State private var lastUpdatedText = "--:--"

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: Theme.Spacing.md) {
                MarketHeaderView()

                HStack {
                    Text("Auto-updating every 8 seconds")
                        .font(Theme.Fonts.subtitle)
                        .foregroundStyle(Theme.Colors.secondaryText)
                    Text(lastUpdatedText)
                        .font(Theme.Fonts.subtitle)
                        .foregroundStyle(Theme.Colors.secondaryText)
                    Spacer()
                }

                TextField("Search stocks by name", text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("market.searchField")
                    .onTapGesture {
                        dismissKeyboard()
                    }

                List(viewModel.filteredQuotes) { quote in
                    NavigationLink {
                        StockDetailView(
                            detail: StockDetail(
                                symbol: quote.symbol,
                                name: quote.name,
                                price: quote.price,
                                change: quote.change,
                                changePercent: quote.changePercent,
                                open: nil,
                                previousClose: nil,
                                dayRange: nil,
                                volume: nil,
                                averageVolume3Month: nil,
                                fiftyTwoWeekRange: nil,
                                marketState: "-",
                                updatedAt: nil
                            )
                        )
                    } label: {
                            VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                                HStack {
                                    Text(quote.name)
                                        .font(Theme.Fonts.headline)
                                    Spacer()
                                    Text(Formatters.currency(quote.price))
                                        .font(Theme.Fonts.headline)
                                }

                                HStack {
                                    Text(quote.symbol)
                                        .font(Theme.Fonts.subtitle)
                                        .foregroundStyle(Theme.Colors.secondaryText)
                                    Spacer()
                                    HStack(spacing: Theme.Spacing.xs) {
                                        Text(Formatters.change(quote.change))
                                        Text(Formatters.percent(quote.changePercent))
                                    }
                                    .font(Theme.Fonts.caption.weight(.bold))
                                    .padding(.horizontal, Theme.Spacing.sm)
                                    .padding(.vertical, Theme.Spacing.xs)
                                    .background(quote.change >= 0 ? Theme.Colors.positive.opacity(0.1) : Theme.Colors.negative.opacity(0.1))
                                    .foregroundStyle(quote.change >= 0 ? Theme.Colors.positive : Theme.Colors.negative)
                                    .clipShape(Capsule())
                            }
                        }
                        .padding(.vertical, Theme.Spacing.xs)
                        .accessibilityIdentifier("market.row.\(quote.symbol)")
                    }
                }
                .listStyle(.plain)
            }
            .padding()
            .overlay(alignment: .topTrailing) {
                if viewModel.isLoading {
                    ProgressView()
                        .padding(.top, Theme.Spacing.sm)
                        .padding(.trailing, Theme.Spacing.sm)
                        .allowsHitTesting(false)
                }
            }
        }
        .task {
            await viewModel.loadQuotes()
            lastUpdatedText = Self.timeStringNow()
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(Constants.refreshInterval))
                if Task.isCancelled { break }
                await viewModel.loadQuotes()
                lastUpdatedText = Self.timeStringNow()
            }
        }
        .onDisappear {
            dismissKeyboard()
        }
    }

    private static func timeStringNow() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "h:mm:ss a"
        return formatter.string(from: .now)
    }

    private func dismissKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

#Preview {
    MarketListView()
}
