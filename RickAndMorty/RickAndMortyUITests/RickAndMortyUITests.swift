//
//  RickAndMortyUITests.swift
//  RickAndMortyUITests
//
//  Created by Cherry on 4/10/25.
//
import XCTest

class RickAndMortyUITests: XCTestCase {
    
    
    func testSearchFunctionality() {
        
        let app = XCUIApplication()
        app.launch()
        
        // Ensure the search text field exists
        let searchField = app.textFields["searchTextField"]
        XCTAssertTrue(searchField.waitForExistence(timeout: 5), "Search text field should exist")
        
        // Interact with the search field
        searchField.tap()
        searchField.typeText("charan")
        
        // Wait for a moment to allow the API call to complete
        sleep(10)
        
        // Wait for the results to load
        let firstCharacterCell = app.tables.cells.firstMatch
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: firstCharacterCell, handler: nil)
      //  waitForExpectations(timeout: 5, handler: nil)
        
        // Verify that the first character cell is displayed
        XCTAssertTrue(firstCharacterCell.exists, "The first character cell should exist")
    }

    
    
    
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
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
