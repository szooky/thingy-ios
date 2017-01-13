//
//  UserProfileViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var tableViewUserProfile: UITableView!
    
    var user: User?
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        user = User.get(variant: 2)
        
        configureView()
        configureTableView()
        configurePullToRefresh()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    func configureView() {
        if let user = self.user, let username = user.username {
            self.navigationItem.title = username
        }
    }
    
    func configureTableView() {
        tableViewUserProfile.dataSource = self
        tableViewUserProfile.delegate = self
        tableViewUserProfile.rowHeight = 300.0
        
        tableViewUserProfile.register(UINib(nibName: UserDetailTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: UserDetailTableViewCell.cellId)
        tableViewUserProfile.register(UINib(nibName: ThingTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: ThingTableViewCell.cellId)
    }

    func configurePullToRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableViewUserProfile.addSubview(refreshControl)
    }
    
    func refresh(sender:AnyObject) {
        refreshControl.endRefreshing()
    }
    


}
