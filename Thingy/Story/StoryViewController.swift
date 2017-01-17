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
        
        //automaticallyAdjustsScrollViewInsets = false
        
        loadStory()
        addImagesToText()
    }
    
    func loadStory() {
        if let story = self.story {
            if let title = story.title {
                labelStoryTitle.text = title
            }
            if let text = story.text {
                //storyTextView.text = text
            }
            if let imageName = story.profileImageURL {
                imageViewStoryBackground.image = UIImage(named: imageName)
            }
        }
    }
    
    func addImagesToText() {
        let attributedString = NSMutableAttributedString(string: "like after")
        
        let textAttachment = NSTextAttachment()
        textAttachment.image = UIImage(named: "garage")?.scaledTo(width: self.view.frame.width)
        let attrStringWithImage = NSAttributedString(attachment: textAttachment)
        attributedString.replaceCharacters(in: NSMakeRange(4, 1), with: attrStringWithImage)
        
        
        storyTextView.attributedText = attributedString
    }


}
