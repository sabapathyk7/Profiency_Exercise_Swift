//
//  ViewController.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var webservice: PEWebservice!
    private var listViewModel: PEListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func updateTableView(){
        self.webservice = PEWebservice()
        self.listViewModel = PEListViewModel(webservice:self.webservice)
        
        
        
    }

}

