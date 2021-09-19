//
//  smartDataSubCell.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation
import  UIKit
import SDWebImage


class smartDataSubCell : UICollectionViewCell {
    
    var cellData : smartDataType? {
        didSet {
            if let title = cellData?.name{
                label.text = title
            }else{
                label.text = "Some Text"
            }
            
            if let image = cellData?.image{
                
                imageView.sd_setImage(with: URL(string: image)) { (uiimage, error, cachedImage, url )in
                    if error == nil {
                        let newImage = imageWithImage(image: uiimage!, scaledToSize: CGSize(width: 30, height: 30))
                        self.imageView.image = newImage
                        
                    }
                }

                

                
            }else{
                print("Sorry")
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
    
    let label : UILabel = {
        var myLabel = UILabel()
        
        myLabel.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.heavy)
        myLabel.textColor  = .black
        myLabel.numberOfLines = 1
        myLabel.textAlignment = .center
        myLabel.translatesAutoresizingMaskIntoConstraints = true
        return myLabel
    }()
    
    let imageView : UIImageView = {
        var myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.contentMode = .center
        myImageView.backgroundColor = .clear
        myImageView.translatesAutoresizingMaskIntoConstraints = false
       // myImageView.layer.masksToBounds = true
        return myImageView
    }()
    
    let imageViewContainer : UIView = {
        var myView = UIView()
        myView.clipsToBounds = true
        myView.backgroundColor = .white
        myView.contentMode = .center
        
        return myView
    }()
    func setUpView(){
        
        addSubview(imageViewContainer)
        imageViewContainer.addSubview(imageView)
        addSubview(label)
        imageViewContainer.frame = CGRect(x: 0, y:0, width: frame.width - 13, height: frame.height - 25)
        
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.imageViewContainer.frame.width - 20,
                                 height: self.imageViewContainer.frame.height - 20)
        
        imageView.centerXAnchor.constraint(equalTo: self.imageViewContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.imageViewContainer.centerYAnchor).isActive = true
        imageViewContainer.contentMode = .center
        label.frame = CGRect(x: 0, y: (frame.height - 20) + 3  , width: frame.width, height: 15)
        imageViewContainer.layer.cornerRadius = imageViewContainer.frame.size.width/2
        imageViewContainer.addShadow(offset: CGSize(width: 10, height: 10), color: .black, radius: 8, opacity: 0.3)
       // imageView.addShadow(offset: CGSize(width: 10, height: 10), color: .black, radius: 8, opacity: 0.3)
        
        label.text = "Some text"
    }
   
    }
    

