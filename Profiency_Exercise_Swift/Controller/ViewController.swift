//
//  ViewController.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {
  
     var navigationBar: UINavigationBar! = UINavigationBar()
     var navigationTitle: UINavigationItem! = UINavigationItem()
     var countryTableView: UITableView! = UITableView()
    
    
//    @IBOutlet var peView: UIView!
//    @IBOutlet weak var navigationTitle: UINavigationItem!
//    @IBOutlet weak var countryTableView: UITableView!
    private var webservice: PEWebservice!
//    @IBOutlet weak var titleBar: UINavigationBar!
    private var listViewModel: PEListViewModel!
    private var dataSource: PETableViewDataSource<PETableViewCell, PEViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createView()
        
        updateTableView()  // Reloading the tableview
        self.countryTableView.addSubview(self.refreshControl)   // Adding refreshControl to the VC subview
        ActivityIndicatorView().showActivityIndicatorView(view: self.view)
    }
    func createView(){
        
        navigationBar = UINavigationBar.init(frame: CGRect.init(x: 0, y: 20, width: self.view.frame.width, height: 64.0))
        navigationBar.backgroundColor = .red
        self.view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
       


        navigationTitle = UINavigationItem.init(title: "Title")
        navigationBar.setItems([navigationTitle], animated: true)
        
        countryTableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        countryTableView.backgroundColor = .blue
        self.view.addSubview(countryTableView)
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        let nvleading = NSLayoutConstraint(item: navigationBar,
                                           attribute: .leading,
                                           relatedBy: .equal,
                                           toItem: self.view,
                                           attribute: .leading,
                                           multiplier: 1.0,
                                           constant: 0)
        
        let nvtrailing = NSLayoutConstraint(item: navigationBar,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: self.view,
                                            attribute: .trailing,
                                            multiplier: 1.0,
                                            constant: 0)
        
        let nvtop = NSLayoutConstraint(item: navigationBar,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: self.view,
                                       attribute: .top,
                                       multiplier: 1.0,
                                       constant: 20)
        
        let nvbottom = NSLayoutConstraint(item: navigationBar,
                                          attribute: .bottom,
                                          relatedBy: .equal,
                                          toItem: countryTableView,
                                          attribute: .bottom,
                                          multiplier: 1.0,
                                          constant: 84.0)
        NSLayoutConstraint.activate([nvleading, nvtrailing, nvtop, nvbottom])
        
        let tvleading = NSLayoutConstraint(item: countryTableView,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: navigationBar,
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 0.0)
        
        let tvtrailing = NSLayoutConstraint(item: countryTableView,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: navigationBar,
                                          attribute: .trailing,
                                          multiplier: 1.0,
                                          constant: 0.0)
        
        let tvtop = NSLayoutConstraint(item: countryTableView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: navigationBar,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 44.0)
        
        let tvbottom = NSLayoutConstraint(item: countryTableView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self.view,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: 0.0)
        
        NSLayoutConstraint.activate([tvleading, tvtrailing, tvtop, tvbottom])

        
        countryTableView.register(PETableViewCell.self, forCellReuseIdentifier: Cells.source)
        
        
        
        
      
        
        
        
        
        
    }
    
    
    
    lazy var refreshControl: UIRefreshControl={
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged) // Handling refresh control using Lazy Variable method so that it can be initilized only when we call the function
        refreshControl.tintColor = .blue
        return refreshControl
    }()
    
    @objc private func handleRefresh(_ sender: Any) {  // Objective C bridge to call the selector method for handling refresh control
        updateTableView()
        refreshControl.endRefreshing()
    }
    
    
    private func updateTableView(){
        // Checking the network connection

        if Reachability.isConnectedToNetwork(){  // If network connection is good
            self.webservice = PEWebservice()
            self.listViewModel = PEListViewModel(webservice: self.webservice)
            
            
            self.listViewModel.bindToSourceViewModels = {
                ActivityIndicatorView().hideActivityIndicatorView(view: self.view)
                self.view.bringSubview(toFront: self.navigationBar)
                self.view.bringSubview(toFront: self.countryTableView)
                self.updateTableViewDataSource()
            }
        }else{ // If network connection doesn't exist
            DispatchQueue.main.async {
                self.addAlert()
            }
        }
    }
    
    
    func addAlert(){
        // Adding alert to the VC
        let alert = UIAlertController(title: Alert.alertTitle, message: Alert.message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: Alert.actionTitle, style: UIAlertActionStyle.default, handler: {action in
            print( Alert.alertText)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    private func updateTableViewDataSource(){
        
        self.navigationTitle.title = Title.title // Assigning the title value to the navigation bar item
        self.dataSource = PETableViewDataSource(cellIdentifier: Cells.source, items: self.listViewModel.countryViewModels, configureCell: { (cell, vm) in   // Configuring the viewmodel and cell from the PETableviewDatasource- UITableViewDataSource
            cell.titleLabel.text = vm.rowTitle // title of the record
            cell.descLabel.text = vm.rowDesc   // description of the record
            let imageURL = vm.rowImgHref // assigning the value of url string
            if let url = URL(string: imageURL!) {
                cell.rowImage?.contentMode = .scaleAspectFit      // Setting content mode
                self.getDataFromUrl(url: url) { data, response, error in
                    guard let data = data, error == nil else { return }   // Using the URLSession we could able to get the image downloaded
                    print(response?.suggestedFilename ?? url.lastPathComponent)
                    print(Response.imageDownload)
                    DispatchQueue.main.async() {
                        cell.rowImage?.image = UIImage(data: data) // Assinging the image
                    }
                }
            }
        })
        self.countryTableView.dataSource = self.dataSource // Assigning the datasource
        self.countryTableView.reloadData()  // reloading the tableview
    }
    
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
   
}

