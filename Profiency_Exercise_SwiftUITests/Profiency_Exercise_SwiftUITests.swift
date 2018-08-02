//
//  Profiency_Exercise_SwiftUITests.swift
//  Profiency_Exercise_SwiftUITests
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import XCTest

class Profiency_Exercise_SwiftUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        let table = XCUIApplication().tables.element(boundBy:0)
        
        // Get the coordinate for the bottom of the table view
        let tableBottom = table.coordinate(withNormalizedOffset:CGVector(dx: 0.5, dy: 50.0))
        
        // Scroll from tableBottom to new coordinate
        let scrollVector = CGVector(dx: 0.0, dy: -220.0)
        tableBottom.press(forDuration: 1.0, thenDragTo: tableBottom.withOffset(scrollVector))

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
