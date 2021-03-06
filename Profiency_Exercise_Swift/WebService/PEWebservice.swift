//
//  PEWebservice.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

// MARK: List of Constants


class PEWebservice{
    private let countryURL = URL(string: API.link)!
    
    func parseJSON(completion: @escaping ([PEModel])->()){
        
        var profiencySource = [PEModel]()
        URLSession.shared.dataTask(with: countryURL) { (data, response, error) in
            guard error == nil else{
                print(Response.error)
                return
            }
            guard let content = data else{
                print(Response.data)
                return
            }
            let returnString: String = String(decoding: content, as: UTF8.self)
            let returnData = returnString.data(using: String.Encoding.utf8)
            let jsonData: Data = returnData!
            guard let json = (try?JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers))as? JSONDictionary else{
                print(Response.jsonData)
                return
            }
            let titleFromAPI = json[APIResponse.title] as? String
            NotificationCenter.default.post(name: Notification.Name(Notify.name), object: nil, userInfo: [APIResponse.title: titleFromAPI as Any])
            let array = json[APIResponse.rows] as! [JSONDictionary]
            profiencySource = array.compactMap(PEModel.init)
            DispatchQueue.main.async {
                completion(profiencySource)
            }
            }.resume()
    }
    
  
   
}
