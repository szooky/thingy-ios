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
    var users = [User]()
    var stories = [Story]()
    
    var filteredThings = [Thing]()
    var filteredUsers = [User]()
    var filteredStories = [Story]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    class var storyboardID: String {
        return "ExploreViewController"
    }
    
    var type: ExploreType = .Things
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.configureSearch()
        self.configurePullToRefresh()

        self.automaticallyAdjustsScrollViewInsets = false
        
        things = Thing.getAll()
        users = User.getAll()
        stories = Story.getAll()
    }
    
    func configureTableView() {
        tableViewExplore.dataSource = self
        tableViewExplore.delegate = self
        tableViewExplore.rowHeight = 100.0
        
        tableViewExplore.register(UINib(nibName: ThingTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: ThingTableViewCell.cellId)
        tableViewExplore.register(UINib(nibName: UserTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: UserTableViewCell.cellId)
        tableViewExplore.register(UINib(nibName: StoryTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: StoryTableViewCell.cellId)
    }
    
    func configurePullToRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.thingyGrey()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableViewExplore.addSubview(refreshControl)
    }
    
    func configureSearch() {
        self.definesPresentationContext = true
        
        tableViewExplore.tableHeaderView = searchController.searchBar

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.barStyle = .blackTranslucent
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.keyboardAppearance = .dark
        searchController.searchBar.tintColor = UIColor.thingyRed()
        
        for view in tableViewExplore.subviews {
            view.backgroundColor = UIColor.thingyGrey() // fix for Apple's bug in TableViewWrapperView white color
        }

    }
    
    func refresh(sender:AnyObject) {
        refreshControl.endRefreshing()
    }
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        tableViewExplore.reloadData()
    }

}
