//
//  UsersListVC.swift
//  Thingy
//
//  Created by Filip Szukala on 13/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class UsersListVC: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    var users: [User]?
    var type: UsersListType = .Followers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        self.users = User.getAll()
    }
    
    func configureTableView() {
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        usersTableView.rowHeight = 100.0
        
        usersTableView.backgroundColor = UIColor.thingyGrey()
        
        usersTableView.register(UINib(nibName: UsersListTableViewCell.cellId, bundle: nil), forCellReuseIdentifier: UsersListTableViewCell.cellId)
    }



}
