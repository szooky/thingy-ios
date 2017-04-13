//
//  UsersListTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 13/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class UsersListTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonFollow: ThingyButton!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    class var cellId: String {
        return "UsersListTableViewCell"
    }
    
    func set(for user: User) {
        if let name = user.username {
            labelUsername.text = name
        }
        
        if let imageName = user.profileImageURL {
            imageViewUserProfile.image = UIImage(named: imageName)
            imageViewUserProfile.round()
            imageViewBackground.image = UIImage(named: imageName)
        }
    }
    
    @IBAction func buttonFollowClicked(_ sender: ThingyButton) {
        sender.isClicked = !sender.isClicked
        
        if sender.isClicked {
            sender.setTitle("followed", for: .normal)
            sender.selectedTextColor = UIColor.black

        } else {
            sender.setTitle("follow", for: .normal)
            sender.selectedTextColor = UIColor.thingyRed()
        }
        
        sender.setApperance()
    }

    
}
