//
//  TopBannerCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//


import Foundation
import UIKit

class BottomBanner : UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data = [smartDataType]()
    
    lazy var bottomBannerData = [smartDataType]()
    
    
    
    private let cellId = "bottomBanner"
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  smartDataTypeCell.delegate = self
        setUpView()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
        
    }
    
    
    
    let collectionViewContainer : UIView = {
        var myView = UIView()
        myView.backgroundColor = .white
        myView.contentMode = .center
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    let BottomBannerCollectionView : UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        layOut.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return collectionView
    }()
    
  
    
    
    func setUpView(){            
        backgroundColor = UIColor.red
        addSubview(collectionViewContainer)
        collectionViewContainer.addSubview(BottomBannerCollectionView)
       
        // will cover entire height
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":collectionViewContainer]))
        //Will cover entire width
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": collectionViewContainer]))
        
        
    BottomBannerCollectionView.topAnchor.constraint(equalTo: collectionViewContainer.topAnchor, constant: 0).isActive=true
        BottomBannerCollectionView.bottomAnchor.constraint(equalTo: collectionViewContainer.bottomAnchor, constant: 0).isActive=true
        BottomBannerCollectionView.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor, constant: -5).isActive=true
        BottomBannerCollectionView.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor, constant: 5).isActive=true
        
        
        BottomBannerCollectionView.register(BottomBannerSubCell.self, forCellWithReuseIdentifier: cellId)
        BottomBannerCollectionView.dataSource = self
        BottomBannerCollectionView.delegate  = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if self.data.count < 2 {
            print(self.bottomBannerData.count)
            return 0
        }else{
            return 2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BottomBannerSubCell
        cell.bannerData = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        
        return CGSize(width: frame.width/2.2, height: frame.height - 10)
       // return CGSize(width: frame.width/2, height: frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 3)
    }
}
