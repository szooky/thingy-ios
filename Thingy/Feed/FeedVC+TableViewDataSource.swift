//
//  FeedViewController+UITableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 06/11/2016.
//  Copyright © 2016 Filip Szukala. All rights reserved.
//

import UIKit

extension FeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedCell = self.tableViewFeed.dequeueReusableCell(withIdentifier: FeedTableViewCell.cellId) as! FeedTableViewCell
        
        feedCell.set(forItem: feedItems[indexPath.row])
        
        return feedCell
    }
    
}
