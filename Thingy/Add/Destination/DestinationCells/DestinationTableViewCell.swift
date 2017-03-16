//
//  DestinationTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 09/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class DestinationTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var stackViewMain: UIStackView!
    @IBOutlet weak var stackViewDetails: UIStackView!
    @IBOutlet weak var stackViewStoryList: UIStackView!
    
    class var cellId: String {
        return "DestinationTableViewCell"
    }
    
    var isExpanded: Bool = false {
        didSet {
            if isExpanded {
                stackViewDetails.isHidden = false
            } else {
                stackViewDetails.isHidden = true
            }
        }
    }
    
    func setAsNewThing(with image: UIImage?) {
        labelTitle.text = "+ add new thing"
        stackViewDetails.isHidden = true
        
        if let image = image {
            imageViewBackground.image = image
        }
    }

    func set(thing: Thing) {
        stackViewDetails.isHidden = true
        
        if let thingTitle = thing.name {
            labelTitle.text = thingTitle
        }
        
        if let thingImageName = thing.profileImageURL {
            imageViewBackground.image = UIImage(named: thingImageName)
        }
        
        if let stories = thing.stories {
            for story in stories {
                let button = UIButton()
                button.setTitle(story.title, for: .normal)
                stackViewStoryList.addArrangedSubview(button)
            }
        }
        
    }
}
