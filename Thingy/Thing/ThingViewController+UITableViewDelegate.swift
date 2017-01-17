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
                self.openStory(row: indexPath.row)
            case tableViewComments:
                self.setCommentsTableViewHeight()
            default:
                return
        }
   
    }
    
    private func openStory(row: Int) {
        let storyStoryBoard = UIStoryboard(name: "StoryStoryboard", bundle: nil)
        if let storyVC = storyStoryBoard.instantiateInitialViewController() as? StoryViewController {
            storyVC.story = thing?.stories?[row]
            self.navigationController?.pushViewController(storyVC, animated: true)
        }
    }
    
    
    
}
