//
//  UIButton+Extension.swift
//  Thingy
//
//  Created by Filip Szukala on 17/03/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension UIButton {
    func addSquareBorder(color: UIColor){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = color.withAlphaComponent(0.5).cgColor
        self.layer.cornerRadius = 20.0
    }
}
