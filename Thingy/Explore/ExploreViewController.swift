//
//  ExploreViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableViewExplore: UITableView!
    
    var refreshControl: UIRefreshControl!

    var things = [Thing]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.configurePullToRefresh()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        things = Thing.getAll()
    }
    
    func configureTableView() {
        tableViewExplore.dataSource = self
        tableViewExplore.delegate = self
        tableViewExplore.rowHeight = 100.0
        
        tableViewExplore.register(UINib(nibName: ThingTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: ThingTableViewCell.cellId)
    }
    
    func configurePullToRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableViewExplore.addSubview(refreshControl)
    }
    
    func refresh(sender:AnyObject) {
        refreshControl.endRefreshing()
    }
    


}
