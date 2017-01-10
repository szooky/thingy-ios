//
//  ExploreViewController+UITableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ExploreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            return things.count
        case 1:
            return stories.count
        case 2:
            return users.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            let thingCell = self.tableViewExplore.dequeueReusableCell(withIdentifier: ThingTableViewCell.cellId) as! ThingTableViewCell
            
            thingCell.set(thing: things[indexPath.row])
            
            return thingCell
            
        case 1:
            let storyCell = self.tableViewExplore.dequeueReusableCell(withIdentifier: StoryTableViewCell.cellId) as! StoryTableViewCell
            
            storyCell.set(story: stories[indexPath.row])
            
            return storyCell
            
        case 2:
            let userCell = self.tableViewExplore.dequeueReusableCell(withIdentifier: UserTableViewCell.cellId) as! UserTableViewCell
            
            userCell.set(user: users[indexPath.row])
            
            return userCell
            
        default:
            return UITableViewCell()
            
        }
        
      
    }
    
}
