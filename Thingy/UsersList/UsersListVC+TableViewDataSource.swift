//
//  UsersList+TableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 13/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension UsersListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = self.usersTableView.dequeueReusableCell(withIdentifier: UsersListTableViewCell.cellId) as! UsersListTableViewCell
        
        userCell.set(for: users![indexPath.row])
        
        return userCell
    }
}
