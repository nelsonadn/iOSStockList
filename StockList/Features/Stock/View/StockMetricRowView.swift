//
//  StockMetricRowView.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI

struct StockMetricRowView: View {
    let title: String
    let value: String
    var isPositive: Bool? = nil

    var body: some View {
        HStack {
            Text(title)
                .font(Theme.Fonts.body)
                .foregroundStyle(Theme.Colors.primaryText)
            Spacer()
            Text(value)
                .font(.caption.bold())
                .padding(.horizontal, Theme.Spacing.sm)
                .padding(.vertical, Theme.Spacing.xs)
                .background(backgroundColor)
                .foregroundStyle(.white)
                .clipShape(Capsule())
        }
        .padding(.vertical, Theme.Spacing.sm)
    }

    private var backgroundColor: Color {
        guard let isPositive else { return Theme.Colors.secondaryBackground }
        return isPositive ? Theme.Colors.positive : Theme.Colors.negative
    }
}
