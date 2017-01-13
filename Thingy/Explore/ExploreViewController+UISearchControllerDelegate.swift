//
//  ExploreViewController+UISearchControllerDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 10/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ExploreViewController: UISearchControllerDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController) {
        tableViewExplore.rowHeight = 100.0
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        tableViewExplore.rowHeight = 100.0

    }
}

