//
//  Constants.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 22/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import Foundation
import UIKit

struct Title {
    static var title: String!
}
struct Cells {
    static let source = "PETableViewCell"
}
struct API{
    static let link = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
}
struct Pevalues {
    
    static let name = "Chicago"
    static let desc = "Chicago is one of the growing/ developing state in the United States "
}
struct Response {
    static let error = "returned error"
    static let data = "No data"
    static let jsonData = "No JSON data from response"
    static let imageDownload = "Download Finished"
}

struct APIResponse {
    static let title = "title"
    static let rows = "rows"

}
struct Notify {
    
    static let name = "titleJSON"

}

struct CellAttributes {
    static let title = "title"
    static let desc = "description"
    static let imageHref = "imageHref"
}

struct Alert {
    static let alertTitle = "Alert"
    static let message = "No Network connection"
    static let actionTitle = "OK"
    static let alertText = "you have pressed the OK button"
}










