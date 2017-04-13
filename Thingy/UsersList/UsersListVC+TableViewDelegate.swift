//
//  UsersListVC+TableViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 13/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension UsersListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let userStoryboard = UIStoryboard(name: "UserStoryboard", bundle: nil)
        if let userVC = userStoryboard.instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController {
            userVC.user = users![indexPath.row]
            userVC.ownProfile = false
            self.navigationController?.pushViewController(userVC, animated: true)
        }
    }

}
