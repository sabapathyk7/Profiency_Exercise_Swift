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
    
    var datasource: PETableViewDataSource<UITableViewCell, Any>!
    private var listViewModel: PEListViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        let webservice = PEWebservice()
        listViewModel = PEListViewModel(webservice: webservice)
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
        let tableView = UITableView()
        tableView.dataSource = datasource
        XCTAssertEqual(datasource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        
        // giving data value
         
        let temp1 = [Pevalues.name, Pevalues.desc]
        let temp2 = [Pevalues.name, Pevalues.desc]
        datasource.items = [temp1, temp2]
        let tableView = UITableView()
        tableView.dataSource = datasource
        XCTAssertEqual(datasource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected two cells
        XCTAssertEqual(datasource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    func testValueCell() {
        
        // giving data value
        let temp = [Pevalues.name, Pevalues.desc]
        datasource.items = temp
        let tableView = UITableView()
        tableView.dataSource = datasource
        tableView.register(PETableViewCell.self, forCellReuseIdentifier: Cells.source)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected CurrencyCell class
        guard let _ = datasource.tableView(tableView, cellForRowAt: indexPath) as? PETableViewCell else {
            XCTAssert(false, "Expected CurrencyCell class")
            return
        }
    }
   
}
