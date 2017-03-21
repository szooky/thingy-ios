//
//  ThingyColors.swift
//  Thingy
//
//  Created by Filip Szukala on 30/10/16.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat){
        self.init(red:r/255.0, green:g/255.0, blue:b/255.0, alpha:a)
    }
    
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat){
        self.init(red:r/255.0, green:g/255.0, blue:b/255.0, alpha:1)
    }
    
    static func thingyOrange() -> UIColor {
        return UIColor(255, 152, 2)
    }
    
    static func thingyRed() -> UIColor {
        return UIColor(255, 0, 66)
    }
    
    static func thingyGrey() -> UIColor {
        return UIColor(49, 49, 49)
    }
    
}
