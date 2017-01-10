//
//  FeedViewController+Mocks.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension FeedViewController {
    func mockFeed() {
        
        let item = FeedItem()
        let user = User()
        
        user.username = "scarlettleithold"
        user.profileImageURL = "scarlett-selfie"
        
        item.user = user
        item.type = .ThingAdd
        
        let thing = Thing()
        thing.name = "Blacked out C63 AMG Coupe"
        thing.owner = user
        thing.profileImageURL = "black_gold_amg"
        
        item.thing = thing
        
        feedItems.append(item)
        
        
        let item2 = FeedItem()
        let user2 = User()
        
        user2.username = "randomchick"
        user2.profileImageURL = "scarlett-sunglasses"
        
        item2.user = user2
        item2.type = .ThingAdd
        
        let thing2 = Thing()
        thing2.name = "Camo RS6 with Miltek Exhaust"
        thing2.owner = user2
        thing2.profileImageURL = "camo_rs6"
        
        item2.thing = thing2
        
        feedItems.append(item2)
        
        let item3 = FeedItem()
        let user3 = User()
        
        user3.username = "anotherone3"
        user3.profileImageURL = "scarlett-bw"
        
        item3.user = user3
        item3.type = .ThingAdd
        
        let thing3 = Thing()
        thing3.name = "Wide body, engine in the tail, chrome lips, V12"
        thing3.owner = user3
        thing3.profileImageURL = "black_hurracan"
        
        item3.thing = thing3
        
        feedItems.append(item3)
        
        tableViewFeed.reloadData()
    }

}
