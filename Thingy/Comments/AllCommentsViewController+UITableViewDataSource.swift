//
//  AllCommentsViewController+UITableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 25/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension AllCommentsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let commentCell = self.tableViewComments.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellId) as! CommentTableViewCell
        
        commentCell.set(comment: comments[indexPath.row])
        
        return commentCell
        
    }
    
}
