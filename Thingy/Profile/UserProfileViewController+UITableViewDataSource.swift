//
//  UserProfileViewController+UITableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 11/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension UserProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let user = self.user, let things = user.things {
            switch section {
                case 0:
                    return 1
                case 1:
                    return things.count
                default:
                    return 0
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let userDetailsCell = self.tableViewUserProfile.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.cellId) as! UserDetailTableViewCell
            
            userDetailsCell.set(forUser: user!)
            
            return userDetailsCell
            
        case 1:
            let thingCell = self.tableViewUserProfile.dequeueReusableCell(withIdentifier: ThingTableViewCell.cellId) as! ThingTableViewCell
            
            thingCell.set(thing: user!.things![indexPath.row])
            
            return thingCell
        default:
            return UITableViewCell()
        }
    }
    
}
