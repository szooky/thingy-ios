//
//  ThingViewController+UITableViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 13/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ThingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
            case tableViewStories:
                self.openStory()
            case tableViewComments:
                self.setCommentsTableViewHeight()
            default:
                return
        }
   
    }
    
    private func openStory() {
        let thingStoryBoard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
        if let thingVC = thingStoryBoard.instantiateInitialViewController() {
            self.navigationController?.pushViewController(thingVC, animated: true)
        }
    }
    
    
    
}
