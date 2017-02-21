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
    
    
    class var cellId: String {
        return "DestinationTableViewCell"
    }
    
    func setAsNewThing(with image: UIImage?) {
        labelTitle.text = "+ add new thing"
        
        if let image = image {
            imageViewBackground.image = image
        }
    }

    func set(thing: Thing) {
        if let thingTitle = thing.name {
            labelTitle.text = thingTitle
        }
        
        if let thingImageName = thing.profileImageURL {
            imageViewBackground.image = UIImage(named: thingImageName)
        }
        
    }
}
