//
//  StoryViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 16/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    var story: Story?
    
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var imageViewStoryBackground: UIImageView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var buttonUsername: UIButton!
    @IBOutlet weak var labelStoryTitle: UILabel!
    @IBOutlet weak var labelCommentsLikes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        loadStory()
        addImagesToText()
        storyTextView.sizeToFit()
    }
    
    func loadStory() {
        if let story = self.story {
            if let title = story.title {
                labelStoryTitle.text = title
             
            if let text = story.text {
                storyTextView.text = text
            }
            if let imageName = story.profileImageURL {
                imageViewStoryBackground.image = UIImage(named: imageName)
            }
            if let author = story.author {
                if let authorImage = author.profileImageURL {
                    imageViewUserProfile.image = UIImage(named: authorImage)
                    imageViewUserProfile.round()
                }
                if let username = author.username {
                    buttonUsername.setTitle(username, for: .normal)
                }
            }
            }
        }
    }
    
    func addImagesToText() {
        let attributedString = NSMutableAttributedString(string: storyTextView.text)

        if let story = self.story, let images = story.storyImages {
            for image in images {
                let textAttachment = NSTextAttachment()
                textAttachment.image = UIImage(named: image)!.scaledTo(width: self.view.frame.width)
                let attrStringWithImage = NSAttributedString(attachment: textAttachment)
                
                storyTextView.textContainer.lineFragmentPadding = 0

                let range = (attributedString.string as NSString).range(of: "#PHOTO")
                attributedString.replaceCharacters(in: range, with: attrStringWithImage)
            }
        }
        storyTextView.attributedText = attributedString
        }
  

}
