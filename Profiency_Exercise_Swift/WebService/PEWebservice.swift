//
//  PEWebservice.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import Foundation

// MARK: List of Constants
let API_COUNTRY:String = "a_string_constant"


class PEWebservice{
   
    func parseJSON(){
        
        let url = URL(string: API_COUNTRY)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard error == nil else{
                print("returned error")
                return
            }
            guard let content = data else{
                print("No data")
                return
            }
            guard let json = (try?JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers))as? [String:Any] else{
                print("No JSON data from response")
                return
            }
            if let array = json["rows"] as? [String:Any]{
                
            }
        }
        
    
    }
}
