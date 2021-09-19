//
//  CatalogViewModel.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation

class CatalogViewModel{
    
    weak var smartDataCollectionView : smartDataTypeCell?
    
    var smartDataArr = [smartDataType]()

    
    func getSmartDataType(completionHandler : @escaping ([smartDataType]) -> ()) {
        
        var modelObject = smartDataType(name: "", image: "", rowCount: 0, dataType: "")
        var smartData = [smartDataType]()
        let request = request()
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let data = data {
                    do{
                        let JSONresponse = try JSONDecoder().decode(results.self, from: data)
                        
                        for i in 0...JSONresponse.result.count - 1{
                            var response = JSONresponse.result[i]
                            if response.dataType == "banner" && response.rowCount == 2 && response.uiType == "grid" {
                                for i in 0...response.data.count - 1 {
                                    modelObject.dataType = response.dataType
                                    modelObject.rowCount = response.rowCount
                                    modelObject.image = response.data[i].image
                                    modelObject.name = response.data[i].name
                                    print(modelObject)
                                    smartData.append(modelObject)
                                }
                                
                                
                            }else if response.dataType == "smart" && response.rowCount == 4 && response.uiType == "grid" {
                                
                                for i in 0...response.data.count - 1 {
                                    modelObject.dataType = response.dataType ?? "smart"
                                    modelObject.rowCount = response.rowCount ?? 4
                                    modelObject.image = response.data[i].image
                                    modelObject.name = response.data[i].name
                                    print(response.dataType,response.rowCount,response.data[i].image,response.data[i].name )
                                    smartData.append(modelObject)
                                }
                                
                            }else if response.dataType == "group" && response.rowCount == 4 && response.uiType == "grid" {
                                
                                for i in 0...response.data.count - 1 {
                                    modelObject.dataType = response.dataType
                                    modelObject.rowCount = response.rowCount
                                    modelObject.image = response.data[i].image
                                    modelObject.name = response.data[i].name
                                    smartData.append(modelObject)
                                }
                            }
                            
                        }
//                        for i in  0...(JSONresponse.result[0].data.count - 1){
//                            let item = JSONresponse.result[0].data[i]
//                            smartData.append(item)
//                        }
                    //    onTaskDone()
                        DispatchQueue.main.async {  
                            completionHandler(smartData)
                        }
                        
                        
                        print(self.smartDataArr.count)
//                        DispatchQueue.main.async {
//                            self.smartDataCollectionView?.smartCollectionView.reloadData()
//                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
    func  checkCount() -> Int {
        return smartDataArr.count
    }
}


