//
//  BannerViewModel.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation

class BannerViewModel{
    
    var bannerArr = [bannerModel]()
    
    func getAllBanners(){
        let request = request()
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                if let data = data {
                    do{
                        
                        print(response)
                        let response = try JSONDecoder().decode(bannerModel.self, from: data)
                        print(response)
                    }catch{
                        print(error.localizedDescription)
                    }
                }
              
            }
        }.resume()
    }
}
