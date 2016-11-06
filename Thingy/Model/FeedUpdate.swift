//
//  FeedUpdate.swift
//  Thingy
//
//  Created by Filip Szukala on 30/10/16.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import Foundation

enum FeedUpdateType {
    case StoryUpdate
    case ThingUpdate
    case ThingAdd
    case StoryAdd
    case StoryComment
    case ThingComment
    case followedUser
}

class FeedUpdate {
    var type: FeedUpdateType?
    var who: User?
    
}
