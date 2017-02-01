//
//  UserDetailTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 11/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var imageViewProfile: UIImageView!
    
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var buttonFollow: UIButton!
    @IBOutlet weak var buttonFollowers: UIButton!
    @IBOutlet weak var buttonFollowing: UIButton!
    
    class var cellId: String {
        return "UserDetailTableViewCell"
    }
    
    func set(forUser user: User) {
        
        self.selectionStyle = .none
        
        if let imageName = user.profileImageURL {
            imageViewBackground.image = UIImage(named: imageName)
            imageViewProfile.image = UIImage(named: imageName)
            imageViewProfile.round()
        }
        
        if let username = user.username {
            labelUsername.text = username
        }
        
        if let description = user.decription {
            labelDescription.text = description
        }
        
        if let followersCount = user.followersCount {
            buttonFollowers.setTitle("\(followersCount) followers", for: .normal)
        }
        
        if let followingCount = user.followingCount {
            buttonFollowing.setTitle("\(followingCount) following", for: .normal)
        }
    }
}
