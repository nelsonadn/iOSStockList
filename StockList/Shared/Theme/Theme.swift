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
        static let positiveText = Color.white
        static let negativeText = Color.white
    }

    enum Fonts {
        static let title = Font.custom("Avenir Next", size: 34).weight(.bold)
        static let headline = Font.custom("Avenir Next", size: 20).weight(.semibold)
        static let subtitle = Font.custom("Avenir Next", size: 16)
        static let body = Font.custom("Avenir Next", size: 17)
        static let caption = Font.custom("Avenir Next", size: 13)
        static let metric = Font.custom("Avenir Next", size: 22).weight(.semibold)
    }

    enum Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
    }
}
