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

    var body: some View {
        HStack {
            Text(title)
                .font(Theme.Fonts.body)
                .foregroundStyle(Theme.Colors.primaryText)
            Spacer()
            Text(value)
                .font(Theme.Fonts.body)
                .foregroundStyle(Theme.Colors.primaryText)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, Theme.Spacing.sm)
    }
}
