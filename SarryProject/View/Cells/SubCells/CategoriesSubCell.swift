//
//  CategoriesSubCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.

import Foundation
import  UIKit

class CategoriesSubCell : UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
        
    }
  
    let imageView : UIImageView = {
        var myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myImageView.layer.masksToBounds = true
        return myImageView
    }()
    func setUpView(){
        
        addSubview(imageView)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        imageView.layer.cornerRadius = imageView.frame.size.width/2
    }
    
}
