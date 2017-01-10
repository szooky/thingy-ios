//
//  Story.swift
//  Thingy
//
//  Created by Filip Szukala on 30/10/16.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import Foundation

class Story {
    var id: String?
    var thingID: String?
    var ownerID: String?
    
    var title: String?
    var text: String?

    var comments: [Comment]?
    
    var likesCount: Int?
    var commentsCount: Int?
    
    var profileImageURL: String?
}
