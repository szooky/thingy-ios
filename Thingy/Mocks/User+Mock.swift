//
//  User+Mock.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension User {
    
    class func get(variant: Int) -> User {
        let user = User()
    
        switch variant {
        case 1:
            user.username = "scarlettleithold"
            user.profileImageURL = "scarlett-selfie"
            
        case 2:
            user.username = "randomchick"
            user.profileImageURL = "scarlett-sunglasses"
            
        default:
            user.username = "anotherone3"
            user.profileImageURL = "scarlett-bw"
            
        }
        
        return user
    }
    
}
