//
//  FeedTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 06/11/2016.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelAction: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var imageViewAvatar: UIImageView!
    
    class var cellId: String {
        return "FeedTableViewCell"
    }
    
    func set(forItem item: FeedItem) {
        if let user = item.user {
            setUser(user: user)
        }
        
        setContent(content: item)
    }
    
    private func setUser(user: User) {
        labelUsername.text = user.username
        
        if let imageName = user.profileImageURL {
            imageViewAvatar.image = UIImage(named: imageName)
            imageViewAvatar.round()
        }
    }
    
    private func setContent(content: FeedItem) {
        func setNewThing(thing: Thing) {
            labelTitle.text = thing.name
            
            if let imageName = thing.profileImageURL {
                imageViewBackground.image = UIImage(named: imageName)
                
            }
        }
        
        func setNewStory(story: Story) {
            labelTitle.text = story.title
            
            if let imageName = story.profileImageURL {
                imageViewBackground.image = UIImage(named: imageName)
                
            }
        }
        
        if let updateTypeText = content.type {
            labelAction.text = updateTypeText.rawValue
        }
        
        switch content.type! {
            case .ThingAdd:
                setNewThing(thing: content.thing!)
            case .StoryAdd, .StoryUpdate:
                setNewStory(story: content.thing!.stories!.first!)

            default:
                return
        }
     
    }

}
