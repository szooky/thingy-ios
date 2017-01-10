//
//  UserTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var imageViewProfile: UIImageView!

    @IBOutlet weak var labelUsername: UILabel!
    
    class var cellId: String {
        return "UserTableViewCell"
    }
    
    func set(user: User) {
        if let name = user.username {
            labelUsername.text = name
        }
        
        if let imageName = user.profileImageURL {
            imageViewProfile.image = UIImage(named: imageName)
            imageViewProfile.round()
            imageViewBackground.image = UIImage(named: imageName)
        }
        
    }
}
