//
//  CommentTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 14/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var buttonUsername: UIButton!
    @IBOutlet weak var labelMessage: UILabel!
    
    class var cellId: String {
        return "CommentTableViewCell"
    }
    
    func set(comment: Comment) {
        if let author = comment.author {
            if let username = author.username {
                buttonUsername.setTitle(username, for: .normal)
            }
            if let imageName = author.profileImageURL {
                imageViewProfile.image = UIImage(named: imageName)
            }
        }
        if let message = comment.message {
            labelMessage.text = message
        }
    }

    
    @IBAction func buttonUsernameClick(_ sender: Any) {
    }
}
