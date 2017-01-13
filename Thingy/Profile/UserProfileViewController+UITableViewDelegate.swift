//
//  UserProfileViewController+UITableViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 11/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension UserProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thingStoryBoard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
        if let thingVC = thingStoryBoard.instantiateInitialViewController() {
            self.navigationController?.pushViewController(thingVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300.0
        case 1:
            return 100.0
        default:
            return 0.0
        }
    }
}
