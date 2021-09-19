//
//  Extensions.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation
import UIKit

extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}

func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{ UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0); image.draw(in:CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
    
}
