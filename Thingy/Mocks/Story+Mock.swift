//
//  Story+Mock.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension Story {
    
    class func get(variant: Int) -> Story {
        let story = Story()
        
        switch variant {
        case 1:
            story.title = "2016 Summer trip to California"
            story.likesCount = 3
            story.commentsCount = 2
            story.profileImageURL = "roadtrip"
            
        case 2:
            story.title = "Garage Worklog | December"
            story.likesCount = 3
            story.commentsCount = 2
            story.profileImageURL = "garage"
            
        default:
            story.title = "Team Black Night Spot 03.12.2016"
            story.likesCount = 3
            story.commentsCount = 2
            story.profileImageURL = "spot"
        }
        
        return story
    }
    
    class func getAll() -> [Story] {
        var stories = [Story]()
        
        for index in 1...3 {
            stories.append(Story.get(variant: index))
        }
        
        return stories
    }
}
