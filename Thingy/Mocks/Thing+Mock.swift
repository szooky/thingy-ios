//
//  Thing+Mock.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension Thing {
    
    class func get(variant: Int) -> Thing {
        let thing = Thing()
        
        switch variant {
        case 1:
            thing.name = "Blacked out C63 AMG Coupe"
            thing.profileImageURL = "black_gold_amg"
            thing.gallery = ["black_gold_amg","camo_rs6","black_hurracan"]
            
        case 2:
            thing.name = "Camo RS6 with Miltek Exhaust"
            thing.profileImageURL = "camo_rs6"
            thing.gallery = ["camo_rs6","black_gold_amg","black_hurracan"]

            
        default:
            thing.name = "Wide body, engine in the tail, chrome lips, V12"
            thing.profileImageURL = "black_hurracan"
            thing.gallery = ["black_hurracan","black_gold_amg","camo_rs6"]
        }
        
        return thing
    }
    
    class func getAll() -> [Thing] {
        var things = [Thing]()
        
        for index in 1...3 {
            things.append(Thing.get(variant: index))
        }
        
        return things
    }
}
