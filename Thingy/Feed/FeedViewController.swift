//
//  FeedViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 06/11/2016.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet var tableViewFeed: UITableView!
    
    var feedItems = [FeedItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.configureTableView()
        
        let item = FeedItem()
        let user = User()
        user.username = "test"
        item.user = user
        feedItems.append(item)
        
        tableViewFeed.reloadData()
    }
    
    func configureTableView() {
        tableViewFeed.dataSource = self
        tableViewFeed.delegate = self
    }



}
