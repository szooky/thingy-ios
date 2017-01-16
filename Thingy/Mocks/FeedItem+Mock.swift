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
        
        let users = Database.sharedInstance.users!
        
        feedItem.user = users[Int().randomNumberFromZero(to: users.count)]
        feedItem.thing = feedItem.user!.things?.first
        feedItem.type = .ThingAdd

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
