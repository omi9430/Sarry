//
//  TopBannerSubCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//


import Foundation
import  UIKit
import FSPagerView

class TopBannerSubCell : FSPagerViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
        
    }
    //TODO: Make it a button 
    let label : UILabel = {
        var myLabel = UILabel()
        myLabel.text = "Some text"
        myLabel.font = UIFont.systemFont(ofSize: 8, weight: UIFont.Weight.heavy)
        myLabel.numberOfLines = 0
        myLabel.textAlignment = .center
        return myLabel
    }()
    
   
    func setUpView(){
        
        addSubview(imageView!)
        addSubview(label)
        imageView!.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        

        print(imageView!.frame)
        imageView!.layer.cornerRadius = 16
    }
    
}
