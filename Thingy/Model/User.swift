//
//  User.swift
//  Thingy
//
//  Created by Filip Szukala on 30/10/16.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import Foundation

class User {
    var id: String?
    var username: String?
    var name: String?
    
    var followersCount: Int?
    var followingCount: Int?
    var followers: [User]?
    var following: [User]?
    
    var things: [Thing]?
    var mostPopularStories: [Story]?
}
