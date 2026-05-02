//
//  StockListUITests.swift
//  StockListUITests
//
//  Created by Nelson Cruz Mora on 2/5/26.
//

import XCTest

final class StockListUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testOpenDetailFromMarketList() throws {
        let app = XCUIApplication()
        app.launch()

        let searchField = app.textFields["market.searchField"]
        XCTAssertTrue(searchField.waitForExistence(timeout: 10))

        let firstRow = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", "market.row.")).firstMatch
        XCTAssertTrue(firstRow.waitForExistence(timeout: 10))
        firstRow.tap()

        let detailName = app.staticTexts["detail.name"]
        XCTAssertTrue(detailName.waitForExistence(timeout: 10))
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
