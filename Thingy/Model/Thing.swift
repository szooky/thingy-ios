//
//  Thing.swift
//  Thingy
//
//  Created by Filip Szukala on 30/10/16.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import Foundation

class Thing {
    var name: String?
    var description: String?
    
    var owner: User?
    
    var stories: [Story]?
    var comments: [Comment]?
    
    var profileImageURL: String?
}
