//
//  UIImageView+Extensions.swift
//  Thingy
//
//  Created by Filip Szukala on 30/10/16.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import UIKit

extension UIImageView {
    func round() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
}
