//
//  BannerModel.swift
//  SarryProject
//
//  Created by omair khan on 13/09/2021.
//

import Foundation

struct bannerModel: Codable {
    let id: Int?
    let title, resultDescription, buttonText: String?
    let image: String?
    let isAvailable: Bool?

    enum CodingKeys: String, CodingKey {
        case id    = "id"
        case title = "title"
        case resultDescription = "description"
        case buttonText = "button_text"
        case image = "image"
        case isAvailable = "is_available"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        resultDescription = try values.decodeIfPresent(String.self,forKey:.resultDescription)
        buttonText = try values.decodeIfPresent(String.self, forKey: .buttonText)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        isAvailable = try values.decodeIfPresent(Bool.self, forKey: .isAvailable)
        
        
    }
}
