//
//  PEWebservice.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

// MARK: List of Constants
let API_COUNTRY:String = "a_string_constant"


class PEWebservice{
   
    func parseJSON(completion:@escaping ([PEModel])->()){
       
        var profiencySource = [PEModel]()
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
            guard let json = (try?JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers))as? JSONDictionary else{
                print("No JSON data from response")
                return
            }
             let array = json["rows"] as! [JSONDictionary]
            profiencySource = array.flatMap(PEModel.init)
            DispatchQueue.main.async {
                completion(profiencySource)
            }
        }.resume()
        
    
    }
}
