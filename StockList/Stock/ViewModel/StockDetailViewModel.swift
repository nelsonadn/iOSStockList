//
//  MarketDetailViewModel.swift
//  StockList
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import Foundation
import Combine

@MainActor
final class StockDetailViewModel: ObservableObject {
    @Published private(set) var detail: StockDetail?
    @Published private(set) var isLoading = false

    func setDetail(_ detail: StockDetail) {
        self.detail = detail
    }
}
