//
//  smartDataTypeCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation
import UIKit
import SDWebImage

class CategoriesCell : UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    
    var categories = [smartDataType]()
    
    private let cellId = "CategoriesSubCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
        
    }
    
    
    let categoriesCollectionView : UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return collectionView
    }()
    
    
    
    
    func setUpView(){
                
       
        backgroundColor = UIColor.red
        addSubview(categoriesCollectionView)
        // will cover entire height
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":categoriesCollectionView]))
        //Will cover entire width
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": categoriesCollectionView]))

        categoriesCollectionView.register(CategoriesSubCell.self, forCellWithReuseIdentifier: cellId)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate  = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(categories.count)
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoriesSubCell
       // cell.label.text = catalogFirstSection[indexPath.row].name!
      //  cell.imageView.addImageFromURL(urlString:catalogFirstSection[indexPath.row].image! )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/5, height: frame.height/4.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
}
