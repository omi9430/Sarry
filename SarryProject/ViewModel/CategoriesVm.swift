//
//  CategoriesVm.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation
import UIKit

class CategoriesVM {
    
    func getAllCategories(){
        
        let request = request()
        URLSession.shared.dataTask(with: request) { (data, response, error )in
            if error == nil {
                if let data = data {
                    do{
                        let response = try JSONDecoder().decode(results.self, from: data)
                        
                        for i in 0...response.result.count - 1 {
                            print(response.result[i])
                        }
                        
                    }catch{
                        
                    }
                }
            }
        }.resume()
    }
}
