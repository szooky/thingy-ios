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
    var ownProfile = true
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let appUser = Database.sharedInstance.appUser {
            self.user = appUser
        }
        
        configureView()
        configureTableView()
        configurePullToRefresh()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        if ownProfile {
            setToOwnProfile()
        }
        
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
    
    private func addLogoutToViewController() {
        let buttonLogout = UIBarButtonItem()
        
        buttonLogout.style  = .plain
        buttonLogout.title = "logout"
        buttonLogout.action = #selector(buttonLogoutClicked)
        buttonLogout.target = self
        
        self.navigationItem.rightBarButtonItem = buttonLogout
    }
    
    func buttonLogoutClicked() {
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let loginRegisterVC = onboardingStoryboard.instantiateInitialViewController() as? OnboardingPageViewController {
            self.present(loginRegisterVC, animated: true, completion: nil)
        }
    }
    
    func setToOwnProfile() {
        self.addLogoutToViewController()
    }
    
}
