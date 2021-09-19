//
//  smartDataTypeCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation
import UIKit
protocol bannerReload {
    func sendBannerData(data : [smartDataType]) -> [smartDataType]
}
class smartDataTypeCell : UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var smartData = [smartDataType]()
    
    
    
    private let cellId = "SmartSubCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
        
    }
    
    
    let smartCollectionView : UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        return collectionView
    }()
  
    func setUpView(){
                
       
        backgroundColor = UIColor.red
        addSubview(smartCollectionView)
        // will cover entire height
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":smartCollectionView]))
        //Will cover entire width
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": smartCollectionView]))

        smartCollectionView.register(smartDataSubCell.self, forCellWithReuseIdentifier: cellId)
        smartCollectionView.dataSource = self
        smartCollectionView.delegate  = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(smartData.count)
        if smartData.count != 0 {
            return smartData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! smartDataSubCell
        cell.cellData = smartData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/5, height: frame.height - 10 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 3, bottom: 5, right: 3)
    }
}
