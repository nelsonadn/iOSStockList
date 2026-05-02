//
//  MarketListView.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI

struct MarketListView: View {
    @StateObject private var viewModel = MarketListViewModel()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: Theme.Spacing.md) {
                MarketHeaderView()

                Text("Auto-updating every 8 seconds")
                    .font(Theme.Fonts.subtitle)
                    .foregroundStyle(Theme.Colors.secondaryText)

                TextField("Search stocks by name", text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)

                List(viewModel.filteredQuotes) { quote in
                    VStack(alignment: .leading, spacing: Theme.Spacing.xs) {
                        HStack {
                            Text(quote.name)
                                .font(.headline)
                            Spacer()
                            Text(Formatters.currency(quote.price))
                                .font(.headline)
                        }

                        HStack {
                            Text(quote.symbol)
                                .font(.subheadline)
                                .foregroundStyle(Theme.Colors.secondaryText)
                            Spacer()
                            Text(Formatters.change(quote.change))
                                .foregroundStyle(quote.change >= 0 ? Theme.Colors.positive : Theme.Colors.negative)
                        }
                    }
                    .padding(.vertical, Theme.Spacing.xs)
                }
                .listStyle(.plain)
            }
            .padding()
        }
        .task {
            await viewModel.loadQuotes()
        }
    }
}

#Preview {
    MarketListView()
}
