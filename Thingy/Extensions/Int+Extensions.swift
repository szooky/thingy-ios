//
//  Int+Extensions.swift
//  Thingy
//
//  Created by Filip Szukala on 16/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension Int {
    func randomNumberFromZero(to range: Int) -> Int {
           return Int(arc4random_uniform(UInt32(range)))
    }
}
