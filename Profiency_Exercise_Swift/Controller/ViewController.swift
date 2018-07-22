//
//  ViewController.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryTableView: UITableView!
    private var webservice: PEWebservice!
    @IBOutlet weak var titleBar: UINavigationBar!
    private var listViewModel: PEListViewModel!
    private var dataSource :PETableViewDataSource<PETableViewCell,PEViewModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateTableView()
        self.countryTableView.addSubview(self.refreshControl)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var refreshControl:UIRefreshControl={
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.blue
        return refreshControl
    }()
    @objc private func handleRefresh(_ sender: Any) {
       updateTableView()
       refreshControl.endRefreshing()

    }
    private func updateTableView(){
        self.webservice = PEWebservice()
        self.listViewModel = PEListViewModel(webservice:self.webservice)
      
        
        self.listViewModel.bindToSourceViewModels = {
            self.updateTableViewDataSource()
        }
        
        
    }
    private func updateTableViewDataSource(){
        
        self.dataSource = PETableViewDataSource(cellIdentifier: Cells.source, items: self.listViewModel.countryViewModels, configureCell: { (cell, vm) in
            cell.titleLabel.text = vm.rowTitle
            cell.descLabel.text = vm.rowDesc
            let imageURL = vm.rowImgHref
            if let url = URL(string: imageURL!) {
                cell.rowImage?.contentMode = .scaleAspectFit
                self.getDataFromUrl(url: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print(response?.suggestedFilename ?? url.lastPathComponent)
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        cell.rowImage?.image = UIImage(data: data)
                    }
                    
                }
            }
        })
        self.countryTableView.dataSource = self.dataSource
        self.countryTableView.reloadData()


        
        
    }
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}

