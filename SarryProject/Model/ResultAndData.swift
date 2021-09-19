//
//  ResultAndData.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation
struct Data : Codable {
    var data : [smartDataType]
    var dataType : String?
    var rowCount : Int?
    var uiType : String?

    
    enum CodingKeys: String, CodingKey {
        case  dataType = "data_type"
        case  data = "data"
        case  rowCount  = "row_count"
        case uiType = "ui_type"
    }
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dataType = try values.decodeIfPresent(String.self, forKey: .dataType)
        data = try values.decodeIfPresent([smartDataType].self, forKey: .data)!
        rowCount = try values.decodeIfPresent(Int.self, forKey: .rowCount)!
        uiType = try values.decodeIfPresent(String.self, forKey: .uiType)!
        
    }
    
}
struct CategoriesData : Codable {
    var data : [CategoriesDataType]
}

struct results : Codable {
    var result : [Data]
    //var dataType : String?
    
    enum CodingKeys: String, CodingKey {
       // case  dataType = "data_type"
        case  result = "result"
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       // dataType = try values.decodeIfPresent(String.self, forKey: .dataType)
        result = try values.decodeIfPresent([Data].self, forKey: .result)!
        
    }
}
