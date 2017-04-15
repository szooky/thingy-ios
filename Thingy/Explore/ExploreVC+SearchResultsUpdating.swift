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
        
        switch self.type {
        case .Things:
            filteredThings = things.filter { thing in
                return thing.name!.lowercased().contains(lowercasedText)
            }
        case .Stories:
            filteredStories = stories.filter { story in
                return story.title!.lowercased().contains(lowercasedText)
            }
        case .Users:
            filteredUsers = users.filter { user in
                return user.username!.lowercased().contains(lowercasedText)
            }
        }
        
        tableViewExplore.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentFor(text: searchController.searchBar.text!)
    }
}
