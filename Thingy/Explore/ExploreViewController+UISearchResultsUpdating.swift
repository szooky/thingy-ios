//
//  ExploreViewController+UISearchResultsUpdating.swift
//  Thingy
//
//  Created by Filip Szukala on 10/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ExploreViewController: UISearchResultsUpdating {
    
    func filterContentFor(text: String) {
        
        let lowercasedText = text.lowercased()
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            filteredThings = things.filter { thing in
                return thing.name!.lowercased().contains(lowercasedText)
            }
        case 1:
            filteredStories = stories.filter { story in
                return story.title!.lowercased().contains(lowercasedText)
            }
        case 2:
            filteredUsers = users.filter { user in
                return user.username!.lowercased().contains(lowercasedText)
            }
        default:
            return
        }
        
        tableViewExplore.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentFor(text: searchController.searchBar.text!)
    }
}
