//
//  AllCommentsViewController+ShowUserProfileDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 01/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension AllCommentsViewController: ShowUserProfileDelegate {
    func show(user: User) {
        let userStoryboard = UIStoryboard(name: "UserStoryboard", bundle: nil)
        if let userVC = userStoryboard.instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController {
            userVC.user = user
            self.navigationController?.pushViewController(userVC, animated: true)
        }
    }
}

