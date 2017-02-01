//
//  ExploreViewController+UITableViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            let thingStoryBoard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
            if let thingVC = thingStoryBoard.instantiateInitialViewController() as? ThingViewController {
                if searchController.isActive && searchController.searchBar.text != "" {
                    thingVC.thing = filteredThings[indexPath.row]
                } else {
                    thingVC.thing = things[indexPath.row]
                }
                self.navigationController?.pushViewController(thingVC, animated: true)
            }
            
        case 1:
            let storyStoryBoard = UIStoryboard(name: "StoryStoryboard", bundle: nil)
            if let storyVC = storyStoryBoard.instantiateInitialViewController() as? StoryViewController {
                if searchController.isActive && searchController.searchBar.text != "" {
                    storyVC.story = filteredStories[indexPath.row]
                } else {
                    storyVC.story = stories[indexPath.row]
                }
                self.navigationController?.pushViewController(storyVC, animated: true)
            }
            
        case 2:
            let mainStoryboard = UIStoryboard(name: "UserStoryboard", bundle: nil)
            if let userVC = mainStoryboard.instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController {
                if searchController.isActive && searchController.searchBar.text != "" {
                    userVC.user = filteredUsers[indexPath.row]
                } else {
                    userVC.user = users[indexPath.row]
                }
                self.navigationController?.pushViewController(userVC, animated: true)
            }
            
        default:
            return
        }
    
    }
}
