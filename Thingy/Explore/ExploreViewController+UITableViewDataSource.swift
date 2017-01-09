//
//  ExploreViewController+UITableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ExploreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let thingCell = self.tableViewExplore.dequeueReusableCell(withIdentifier: ThingTableViewCell.cellId) as! ThingTableViewCell
        
        thingCell.set(thing: things[indexPath.row])
        
        return thingCell
    }
    
}
