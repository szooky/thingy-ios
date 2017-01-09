//
//  ThingTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class ThingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var labelThingTitle: UILabel!
    @IBOutlet weak var labelThingDetails: UILabel!
    
    class var cellId: String {
        return "ThingTableViewCell"
    }
    
    func set(thing: Thing) {
        labelThingTitle.text = thing.name
        
        if let likes = thing.likes,
            let stories = thing.storiesCount,
            let comments = thing.commentsCount {
                labelThingDetails.text = "\(likes) LIKES | \(stories) STORIES | \(comments) COMMENTS"
        }
        
        if let imageName = thing.profileImageURL {
            imageViewBackground.image = UIImage(named: imageName)
        }
        
    }
    
}
