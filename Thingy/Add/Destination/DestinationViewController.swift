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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUsersData()
        self.configureTableView()
    }
    
    func loadUsersData() {
        self.user = User.get(variant: 1)
    }
    
    func configureTableView() {
        tableViewDestination.dataSource = self
        tableViewDestination.delegate = self
        tableViewDestination.rowHeight = 300.0
        
        tableViewDestination.register(UINib(nibName: DestinationTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: DestinationTableViewCell.cellId)
    }

}
