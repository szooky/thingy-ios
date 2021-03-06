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
        case 0:
            user.username = "szooky"
            user.profileImageURL = "szooky"
            user.things = [Thing.get(variant: 0)]
            user.followersCount = 324
            user.followingCount = 543
            user.decription = "CEO of Thingy, iOS Developer, Petrolhead and Photographer. 🤓"
        case 1:
            user.username = "scarlettleithold"
            user.profileImageURL = "scarlett-selfie"
            user.things = [Thing.get(variant: variant)]
            
        case 2:
            user.username = "randomchick"
            user.profileImageURL = "scarlett-sunglasses"
            user.followingCount = 3
            user.followersCount = 4
            user.things = Thing.getAll()
            user.decription = "I'm intrested in fast cars and cameras 🚗😍"

        default:
            user.username = "anotherone3"
            user.profileImageURL = "scarlett-bw"
            user.things = [Thing.get(variant: variant)]
            
        }
        
        return user
    }
    
    class func getAll() -> [User] {
        var users = [User]()
        
        for index in 0...3 {
            users.append(User.get(variant: index))
        }
        
        return users
    }
    
}
