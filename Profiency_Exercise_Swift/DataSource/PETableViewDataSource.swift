//
//  PETableViewDataSource.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 22/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class PETableViewDataSource<Cell: UITableViewCell, ViewModel>: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    private var cellIdentifier: String!
    var items: [ViewModel]!
    var configureCell: (Cell, ViewModel)->()

    init(cellIdentifier: String, items: [ViewModel],configureCell: @escaping (Cell, ViewModel)->()){
        // Initializing the View Model, Cell identifier  to view model
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count  // Returning the number of rows in the section of the tableview
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]// Assigning the values from the model class items to the cell based on the indexpath.
        self.configureCell(cell, item)// Configuring the cell using the cell identifier and items to be displayed
        return cell
        
    }
}
