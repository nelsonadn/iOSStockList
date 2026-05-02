//
//  ErrorView.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI

struct ErrorView: View {
    let message: String

    var body: some View {
        VStack(spacing: Theme.Spacing.sm) {
            Text("Something went wrong")
                .font(Theme.Fonts.body.bold())
            Text(message)
                .font(Theme.Fonts.caption)
                .foregroundStyle(Theme.Colors.secondaryText)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
    }
}
