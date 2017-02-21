//
//  DestinationViewController+UITableViewDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 09/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension DestinationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let user = self.user, let things = user.things {
            switch section {
            case 0:
                return 1
            case 1:
                return things.count
            default:
                return 0
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let destinationCell = self.tableViewDestination.dequeueReusableCell(withIdentifier: DestinationTableViewCell.cellId) as! DestinationTableViewCell
            
            let imagesSelectedInLibrary = [UIImage(named: "camo_rs6")]
            
            destinationCell.setAsNewThing(with: imagesSelectedInLibrary.first!)
            
            return destinationCell
            
        case 1:
           let destinationCell = self.tableViewDestination.dequeueReusableCell(withIdentifier: DestinationTableViewCell.cellId) as! DestinationTableViewCell
            destinationCell.set(thing: user!.things![indexPath.row])
            
            return destinationCell
        default:
            return UITableViewCell()
        }
    }
    
}
