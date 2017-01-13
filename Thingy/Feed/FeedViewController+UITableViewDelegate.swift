//
//  FeedViewController+UITableViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 06/11/2016.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import UIKit

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let thingStoryBoard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
        if let thingVC = thingStoryBoard.instantiateInitialViewController() {
            self.navigationController?.pushViewController(thingVC, animated: true)
        }
    }
}
