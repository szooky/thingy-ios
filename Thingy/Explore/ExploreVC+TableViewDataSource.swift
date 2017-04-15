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
        if searchController.isActive && searchController.searchBar.text != "" {
            switch self.type {
                case .Things:
                    return filteredThings.count
                case .Stories:
                    return filteredStories.count
                case .Users:
                    return filteredUsers.count
            }
        } else {
            switch self.type {
                case .Things:
                    return things.count
                case .Stories:
                    return stories.count
                case .Users:
                    return users.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.type {
        case .Things:
            let thingCell = self.tableViewExplore.dequeueReusableCell(withIdentifier: ThingTableViewCell.cellId) as! ThingTableViewCell
            
            if searchController.isActive && searchController.searchBar.text != "" {
                thingCell.set(thing: filteredThings[indexPath.row])
            } else {
                thingCell.set(thing: things[indexPath.row])
            }
            
            return thingCell
            
        case .Stories:
            let storyCell = self.tableViewExplore.dequeueReusableCell(withIdentifier: StoryTableViewCell.cellId) as! StoryTableViewCell
            
            if searchController.isActive && searchController.searchBar.text != "" {
                storyCell.set(story: filteredStories[indexPath.row])
            } else {
                storyCell.set(story: stories[indexPath.row])
            }
        
            return storyCell
            
        case .Users:
            let userCell = self.tableViewExplore.dequeueReusableCell(withIdentifier: UserTableViewCell.cellId) as! UserTableViewCell
            
            if searchController.isActive && searchController.searchBar.text != "" {
                userCell.set(user: filteredUsers[indexPath.row])
            } else {
                userCell.set(user: users[indexPath.row])
            }
            
            return userCell
            
        }
        
    }
    
}
