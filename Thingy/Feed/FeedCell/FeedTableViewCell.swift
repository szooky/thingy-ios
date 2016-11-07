//
//  FeedTableViewCell.swift
//  Thingy
//
//  Created by Filip Szukala on 06/11/2016.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var labelUsername: UILabel!
    
    class var cellId: String {
        return "idFeedTableViewCell"
    }
    
    func set(forItem item: FeedItem) {
        labelUsername.text = item.user?.name
    }
}
