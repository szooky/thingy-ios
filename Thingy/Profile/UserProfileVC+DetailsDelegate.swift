//
//  UserProfileVC+DetailsDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 13/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension UserProfileViewController: UserDetailTableViewCellDelegate {
    func didClickedFollowersButton() {
        let usersListVC = UsersListVC(nibName: "UsersListVC", bundle: nil)
        usersListVC.type = .Followers
        self.navigationController?.pushViewController(usersListVC, animated: true)
        
    }
    
    func didClickedFollowingButton() {
        let usersListVC = UsersListVC(nibName: "UsersListVC", bundle: nil)
        usersListVC.type = .Following
        self.navigationController?.pushViewController(usersListVC, animated: true)
    }
}
