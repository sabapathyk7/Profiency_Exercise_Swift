//
//  PETitleModel.swift
//  Profiency_Exercise_Swift
//
//  Created by Dev 17 on 7/24/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class PETitleModel: NSObject {
    var countryTitle :String!
    
    init?(titleString:String) {
        guard let title = titleString as?String else{
            return nil
        }
            self.countryTitle = title
    }
    
    
    init(viewModel: PEViewModel){
        
        self.countryTitle = viewModel.rowTitle
      
    }
}
