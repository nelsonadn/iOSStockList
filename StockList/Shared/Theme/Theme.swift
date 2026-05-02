//
//  Theme.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import SwiftUI

enum Theme {
    enum Colors {
        static let background = Color(.systemBackground)
        static let secondaryBackground = Color(.secondarySystemBackground)
        static let primaryText = Color.primary
        static let secondaryText = Color.secondary
        static let positive = Color.green
        static let negative = Color.red
    }

    enum Fonts {
        static let title = Font.largeTitle.weight(.bold)
        static let subtitle = Font.subheadline
        static let body = Font.body
        static let caption = Font.caption
        static let metric = Font.title3.weight(.semibold)
    }

    enum Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
    }
}
