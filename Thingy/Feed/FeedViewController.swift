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
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.configurePullToRefresh()
  
        self.automaticallyAdjustsScrollViewInsets = false
        
        mockFeed()
    }
    
    func configureTableView() {
        tableViewFeed.dataSource = self
        tableViewFeed.delegate = self
        tableViewFeed.rowHeight = 300.0
        
        tableViewFeed.register(UINib(nibName: FeedTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: FeedTableViewCell.cellId)
    }
    
    func configurePullToRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableViewFeed.addSubview(refreshControl)
    }
    
    func refresh(sender:AnyObject) {
        refreshControl.endRefreshing()
    }
    
}
