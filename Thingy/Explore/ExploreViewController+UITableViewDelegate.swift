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
        
        let thingStoryBoard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
        if let thingVC = thingStoryBoard.instantiateInitialViewController() {
            self.navigationController?.pushViewController(thingVC, animated: true)
        }
    }
}
