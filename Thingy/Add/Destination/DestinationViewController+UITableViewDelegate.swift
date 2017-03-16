//
//  DestinationViewController+UITableViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 09/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension DestinationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            //new thing
            return
        }
        
        guard let cell = tableView.cellForRow(at: indexPath) as? DestinationTableViewCell
            else { return }
        
        
        cell.isExpanded = !cell.isExpanded
        
        self.tableViewDestination.beginUpdates()
        self.tableViewDestination.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? DestinationTableViewCell
            else { return }
        
        cell.isExpanded = false
        
        self.tableViewDestination.beginUpdates()
        self.tableViewDestination.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100.0
        case 1:
            return UITableViewAutomaticDimension //automatic!
        default:
            return 0.0
        }
    }
}
