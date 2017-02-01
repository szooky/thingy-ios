//
//  CommentTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 14/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

protocol ShowUserProfileDelegate: class {
    func show(user: User)
}

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var buttonUsername: UIButton!
    @IBOutlet weak var labelMessage: UILabel!
    
    class var cellId: String {
        return "CommentTableViewCell"
    }
    
    var comment: Comment?
    weak var showUserProfileDelegate: ShowUserProfileDelegate?
    
    func set(comment: Comment) {
        self.comment = comment
        
        if let author = comment.author {
            if let username = author.username {
                buttonUsername.setTitle(username, for: .normal)
            }
            if let imageName = author.profileImageURL {
                imageViewProfile.image = UIImage(named: imageName)
                imageViewProfile.round()
            }
        }
        
        if let message = comment.message {
            labelMessage.text = message
        }
        
        addTapGestureToUserImageView()
    }
    
    private func addTapGestureToUserImageView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageViewProfileClicked(imageView:)))
        imageViewProfile.isUserInteractionEnabled = true
        imageViewProfile.addGestureRecognizer(tapGestureRecognizer)

    }
    
    func imageViewProfileClicked(imageView: UIImageView) {
        showAuthorProfile()
    }

    @IBAction func buttonUsernameClick(_ sender: Any) {
        showAuthorProfile()
    }

    private func showAuthorProfile() {
        if let author = self.comment?.author {
            self.showUserProfileDelegate?.show(user: author)
        }
    }

}
