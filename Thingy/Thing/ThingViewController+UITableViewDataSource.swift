//
//  ThingViewController+UITableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 13/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ThingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case tableViewStories:
                return thing?.stories?.count ?? 0
            case tableViewComments:
                return thing?.comments?.count ?? 0
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case tableViewStories:
            let storyCell = self.tableViewStories.dequeueReusableCell(withIdentifier: StoryTableViewCell.cellId) as! StoryTableViewCell
            
            storyCell.set(story: thing!.stories![indexPath.row])
    
            return storyCell
            
        case tableViewComments:
            let commentCell = self.tableViewComments.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellId) as! CommentTableViewCell
            
            commentCell.set(comment: thing!.comments![indexPath.row])
            
            return commentCell
            
        default:
            return UITableViewCell()
            
        }
        
    }
    
}


