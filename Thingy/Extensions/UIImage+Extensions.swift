//
//  UIImage+Extensions.swift
//  Thingy
//
//  Created by Filip Szukala on 17/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension UIImage {
    
    func scaledTo(size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func scaledTo(height: CGFloat) -> UIImage{
        let width = height*self.size.width/self.size.height
        return scaledTo(size: CGSize(width: width, height: height))
    }
    
    func scaledTo(width: CGFloat) -> UIImage{
        let height = width*self.size.height/self.size.width
        return scaledTo(size: CGSize(width: width, height: height))
    }
}
