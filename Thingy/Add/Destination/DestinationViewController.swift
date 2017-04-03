//
//  DestinationViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 09/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    @IBOutlet weak var tableViewDestination: UITableView!
    
    var user: User?
    var expandedCellIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUsersData()
        self.configureView()
        self.configureTableView()
    }
    
    func loadUsersData() {
        self.user = User.get(variant: 2)
    }
    
    func configureView() {
        self.view.backgroundColor = UIColor.thingyGrey()
    }
    
    func configureTableView() {
        tableViewDestination.dataSource = self
        tableViewDestination.delegate = self
        tableViewDestination.rowHeight = UITableViewAutomaticDimension
        tableViewDestination.estimatedRowHeight = 2
        tableViewDestination.backgroundColor = UIColor.thingyGrey()
        
        tableViewDestination.register(UINib(nibName: DestinationTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: DestinationTableViewCell.cellId)
    }

}
