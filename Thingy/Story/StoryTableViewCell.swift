//
//  StoryTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 10/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetails: UILabel!

    class var cellId: String {
        return "StoryTableViewCell"
    }
    
    func set(story: Story) {
        labelTitle.text = story.title
        
        if let likes = story.likesCount,
            let comments = story.commentsCount {
            labelDetails.text = "\(likes) LIKES | \(comments) COMMENTS"
        }
        
        if let imageName = story.profileImageURL {
            imageViewBackground.image = UIImage(named: imageName)
        }
        
    }
    
    
}
