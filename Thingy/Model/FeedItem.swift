//
//  FeedUpdate.swift
//  Thingy
//
//  Created by Filip Szukala on 30/10/16.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import Foundation

enum FeedUpdateType: String {
    case StoryUpdate = "updated story:"
    case ThingUpdate = "updated thing:"
    case ThingAdd = "added new thing:"
    case StoryAdd = "added new story:"
    case StoryComment = "commented story:"
    case ThingComment = "commented thing:"
    case followedUser = "followed user:"
}

class FeedItem {
    var type: FeedUpdateType?
    var user: User?
    var thing: Thing?
    
}
