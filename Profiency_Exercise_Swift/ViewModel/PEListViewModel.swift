//
//  PEListViewModel.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 21/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class PEListViewModel: NSObject {
    @objc dynamic private(set) var countryViewModels :[PEViewModel] = [PEViewModel]()
    private var webservice: PEWebservice  //  Webservice
    
    init(webservice:PEWebservice){
        self.webservice = webservice
        super.init()
        populateListData()
    }
    func populateListData(){
        self.webservice .parseJSON { [unowned self] listData in
            self.countryViewModels = listData.flatMap(PEViewModel.init)
        }
    }
}

class PEViewModel: NSObject {
    var rowTitle:String!
    var rowDesc :String!
    var rowImgHref:String!
    
    init(title: String, desc: String, image:String){
        self.rowTitle = title
        self.rowDesc = desc
        self.rowImgHref = image
    }
    
    init(pemodel:PEModel){
        self.rowTitle = pemodel.rowTitle
        self.rowDesc = pemodel.rowDesc
        self.rowImgHref = pemodel.rowImgHref

    }
    
}
