//
//  BannerCell.swift
//  SarryProject
//
//  Created by omair khan on 13/09/2021.
//

import Foundation
import UIKit

class BannerCell: UICollectionViewCell {
    
    
    var imageView : UIImageView = {
        
        var myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.isUserInteractionEnabled = false
        myImageView.contentMode = .center

        return myImageView
    }()
    
    var button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: 5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}

