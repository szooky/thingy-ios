//
//  FeedItem+Mock.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension FeedItem {
    
    class func get(variant: Int) -> FeedItem {
        let feedItem = FeedItem()
        
        if let users = Database.sharedInstance.users {
            feedItem.user = users[variant - 1]
        }
        
        switch variant {
        case 1:
            feedItem.thing = feedItem.user!.things?.first
            feedItem.type = .ThingAdd
        case 2:
            feedItem.thing = feedItem.user!.things?.first
            feedItem.type = .StoryAdd
            
        default:
            feedItem.thing = feedItem.user!.things?.first
            feedItem.type = .StoryUpdate
        }
        
        return feedItem
    }
    
    class func getAll() -> [FeedItem] {
        var feedItems = [FeedItem]()
        
        for index in 1...3 {
            feedItems.append(FeedItem.get(variant: index))
        }
        
        return feedItems
    }
}
