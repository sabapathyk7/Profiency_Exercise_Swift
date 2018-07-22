//
//  PEModel.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class PEModel: NSObject {

    var rowTitle :String!
    var rowDesc :String!
    var rowImgHref :String!
    
    init?(dictionary:JSONDictionary) {
        guard let title = dictionary["title"] as?String,
        let desc = dictionary["description"] as?String,
            let imageHref = dictionary["imageHref"] as?String else{
                return nil
        }
        self.rowTitle = title
        self.rowDesc = desc
        self.rowImgHref = imageHref
        
    }
    init(viewModel: PEViewModel){
    
//        self.rowTitle = viewModel.
    }
    
    
}
