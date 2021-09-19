//
//  SmartDataType.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation

struct smartDataType: Codable {
    var name: String?
    var image: String?
    var rowCount : Int?
    var dataType : String?
    


    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image = "image"
    }
    
    init(name: String, image : String, rowCount : Int, dataType : String) {
        self.name = name
        self.image = image
        self.rowCount  = rowCount
        self.dataType = dataType
        
    }
}

