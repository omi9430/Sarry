//
//  TopBannerSubCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//


import Foundation
import  UIKit
import SDWebImage

class BottomBannerSubCell : UICollectionViewCell {
    
    var bannerData : smartDataType?  {
        didSet {
            if let image = bannerData?.image{
                
                imageView.sd_setImage(with: URL(string: image)) {(uiimage, error, cachedImage, url )in
                    if error == nil {
                        let newImage = imageWithImage(image: uiimage!, scaledToSize: CGSize(width: self.imageView.frame.width - 10, height: self.imageView.frame.height - 10 ))
                        self.imageView.image = newImage
                    }else{
                        print(error?.localizedDescription)
                    }
                   
                }

                
            }else{
                print("No Image Found")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
        
    }
    //TODO: Make it a button
    let button : UIButton = {
        var myButton = UIButton()
        myButton.titleLabel?.text = "Some Text"
        myButton.titleLabel?.numberOfLines = 0
        myButton.backgroundColor = .white
        
        myButton.titleLabel?.font = UIFont.systemFont(ofSize: 8, weight: UIFont.Weight.heavy)
       
        return myButton
    }()
    let imageViewContainer : UIView = {
        var myView = UIView()
        myView.clipsToBounds = true
        myView.backgroundColor = .white
        myView.contentMode = .center
        
        return myView
    }()
    
    let imageView : UIImageView = {
        var myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        myImageView.layer.masksToBounds = true
        return myImageView
    }()
    func setUpView(){
        
        addSubview(imageViewContainer)
        imageViewContainer.addSubview(imageView)
     
        imageViewContainer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageView.centerXAnchor.constraint(equalTo: imageViewContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageViewContainer.centerYAnchor).isActive = true
        print(imageView.frame)
        imageViewContainer.layer.cornerRadius = 12
    }
    
}
