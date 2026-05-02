//
//  LoadingView.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: Theme.Spacing.sm) {
            ProgressView()
            Text("Loading")
                .font(Theme.Fonts.caption)
                .foregroundStyle(Theme.Colors.secondaryText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
