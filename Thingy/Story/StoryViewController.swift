//
//  StoryViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 16/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UINavigationControllerDelegate {

    var story: Story?
    
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var imageViewStoryBackground: UIImageView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var buttonUsername: UIButton!
    @IBOutlet weak var buttonSeeComments: UIButton!
    @IBOutlet weak var labelStoryTitle: UILabel!
    @IBOutlet weak var labelCommentsLikes: UILabel!
    
    var editBarButton: UIBarButtonItem!
    var saveBarButton: UIBarButtonItem!
    var cameraBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStory()
        addImagesToText()
        setStoryTextView()
        setBarButtons()
    }
    
    func setStoryTextView() {
        storyTextView.textAlignment = .center
        storyTextView.font = UIFont(name: "HelveticaNeue-Thin", size: 20.0)
        storyTextView.isEditable = false
        storyTextView.isSelectable = false
        storyTextView.keyboardAppearance = .dark
    }
    
    private func setBarButtons() {
        editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(StoryViewController.buttonEditClicked))
        
        saveBarButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(StoryViewController.buttonSaveClicked))
    
        cameraBarButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(StoryViewController.buttonAddPhotoClicked))
        
        self.navigationItem.setRightBarButtonItems([editBarButton], animated: true)
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
                imageViewStoryBackground.applyThingyGradient(ofSize: imageViewStoryBackground.bounds)
            }
                
            if let commentsCount = story.commentsCount {
                buttonSeeComments.setTitle("SEE COMMENTS (\(commentsCount))", for: .normal)
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
            for imageName in images {
                let textAttachment = NSTextAttachment()
                if let image = UIImage(named: imageName) {
                
                    textAttachment.image = image.scaledTo(width: self.view.frame.width)
                    
                    let emptyLine = NSAttributedString(string: "\n")
                    
                    let finalString = NSMutableAttributedString(attributedString: emptyLine)
                    let stringWithImage = NSAttributedString(attachment: textAttachment)
                    
                    finalString.append(stringWithImage)
                    finalString.append(emptyLine)
                    
                    let paragraphStyle = NSMutableParagraphStyle()
    
                    paragraphStyle.paragraphSpacing = 20.0
                    paragraphStyle.paragraphSpacingBefore = 20.0
                    paragraphStyle.alignment = .center

                    let imageRange = NSRange(location: 0, length: finalString.length)
                    finalString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: imageRange)
                
                    storyTextView.textContainer.lineFragmentPadding = 0

                    let range = (attributedString.string as NSString).range(of: "#PHOTO#")
                    attributedString.replaceCharacters(in: range, with: finalString)
                }
            }
        }
        storyTextView.attributedText = attributedString
    }

    @IBAction func buttonSeeCommentsClicked(_ sender: UIButton) {
        let vcAllComments = AllCommentsViewController(nibName: "AllCommentsViewController", bundle: nil)
        self.navigationController?.pushViewController(vcAllComments, animated: true)
    }
    
    func buttonSaveClicked() {
        self.navigationItem.setRightBarButtonItems([editBarButton], animated: true)
        storyTextView.isEditable = false
        storyTextView.isSelectable = false
    }
    
    func buttonEditClicked() {
        self.navigationItem.setRightBarButtonItems([saveBarButton,cameraBarButton], animated: true)
        self.storyTextView.isEditable = true
        self.storyTextView.isSelectable = true
    }
    
    func buttonAddPhotoClicked() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
}
