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
        case 0:
            story.title = "Team Vomit April Spot"
            story.likesCount = 234
            story.commentsCount = 32
            story.profileImageURL = "vomit_spot_1"
            story.storyImages = ["vomit_spot_2","vomit_spot_3","vomit_spot_4","vomit_spot_5","vomit_spot_6","vomit_spot_7","vomit_spot_8","vomit_spot_9"]
            story.text = "New Lex showed up 🙌🏻 #PHOTO# CinemaCity Underground Parking as shooting location is 🔥 #PHOTO# #PHOTO# #PHOTO# #PHOTO# #PHOTO# #PHOTO# #PHOTO#"
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
        case 3:
            story.title = "Rusty Slamington @ SEMA 2014"
            story.likesCount = 20
            story.commentsCount = 6
            story.profileImageURL = "rusty1"
            story.storyImages = ["rusty1","rusty2","rusty3"]
            story.text = "Rusty Slammington - Today at SEMA, one day before the show begins, Mike Burroughs revealed his famed creation. After four years behind closed doors and two years under the knife, we've pulled the cover back on Rusty Slammington. #PHOTO# From the tube chassis and the and custom H&R suspension, to the race-prepped S38 and the center-lock BBS E52s, little remains from the E28's past iteration; however, Rusty's heart and soul remains. Today, a legend has returned. On H&R Suspension's stage, Rusty sits front-and-center at SEMA 2015, eagerly awaiting the mass of onlookers as the show officially opens tomorrow morning. While the build itself encompasses a list of details far too long to list, we're anxious to touch upon the details that help to make Rusty whole again. #PHOTO# In March of 2014, we began the rebuild, beginning with an empty shell. Over the course of the past year and a half, construction consumed countless nights and thousands of hours, all beginning with the custom tube chassis. Built from the ground up by Mike Burroughs and Byron Wilcox to suit the needs of a Rusty revival, the wheelbase of the car has been shortened nearly a foot, as has been the body. Now shorter, the aesthetics of the car have been converted to encompass all things Group 5: two doors, wide fenders, and an uncompromising presence. BBSs sourced from a Porsche 956 give the car its foundation, with a 16x12 and 19x14.5 stagger. Behind them, Wilwood brakes provide the stopping power. H&R suspension gives the car its control, with pushrods allowing for inboard suspension in a dedicated racing setup. VAC Motorsports built the engine: an all-out S38 punched out to 3.7 liters. 14:1 compression pistons are the centerpiece of a forged set of internals. Dry sump accessories crowd the engine bay, and PFM Autosport custom-built headers route the exhaust out through the rocker. Built to recreate the monster M88s that powered the M1 ProCars and the M49s of the E9 CSLs, the S38 leaves little to be desired. At the tail end of the car, Nuke Performance and ATL fuel system parts provide 110 octane fuel to the heart. #PHOTO# The tube chassis surrounds the components, and perched above them are the rear coilovers, mounted in the center of the car, visible through the Lexan rear window. A few inches forward are the air jacks, which lift the car in an instant."
            
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
