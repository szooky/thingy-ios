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
        
        if let updateType = item.type {
            setUpdateType(action: updateType)
        }
        
        if let thing = item.thing {
            setThing(thing: thing)
        }
    }
    
    private func setUser(user: User) {
        labelUsername.text = user.username
        
        if let imageName = user.profileImageURL {
            imageViewAvatar.image = UIImage(named: imageName)
            imageViewAvatar.round()
        }
    }
    
    private func setThing(thing: Thing) {
        labelTitle.text = thing.name
        
        if let imageName = thing.profileImageURL {
            imageViewBackground.image = UIImage(named: imageName)
        }
    }
    
    private func setUpdateType(action: FeedUpdateType) {
        switch action {
            case .ThingAdd: labelAction.text = "added new item:"
            default: labelAction.text = "updated:"
        }
    }
}
