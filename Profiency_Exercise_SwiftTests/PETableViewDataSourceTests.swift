//
//  PETableViewDataSourceTests.swift
//  Profiency_Exercise_SwiftTests
//
//  Created by kanagasabapathy on 23/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import XCTest
@testable import Profiency_Exercise_Swift
class PETableViewDataSourceTests: XCTestCase {
    var datasource:PETableViewDataSource<UITableViewCell, Any>!
    private var listViewModel: PEListViewModel!

    override func setUp() {
        super.setUp()
        var webservice = PEWebservice()

        listViewModel = PEListViewModel(webservice:webservice)

        // Put setup code here. This method is called before the invocation of each test method in the class.
        datasource = PETableViewDataSource(cellIdentifier: Cells.source, items: listViewModel.countryViewModels, configureCell: { (cell, vm) in
            
        })
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        datasource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        datasource = PETableViewDataSource(cellIdentifier: Cells.source, items: listViewModel.countryViewModels, configureCell: { (cell, vm) in
            
        })
        
        let tableView = UITableView()
        tableView.dataSource = datasource
        
        // expected one section
        
        // expected zero cells
        XCTAssertEqual(datasource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        
        // giving data value
        datasource = PETableViewDataSource(cellIdentifier: Cells.source, items: listViewModel.countryViewModels, configureCell: { (cell, vm) in
            
        })
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
