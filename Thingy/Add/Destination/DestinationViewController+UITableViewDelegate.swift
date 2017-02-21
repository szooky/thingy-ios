//
//  DestinationViewController+UITableViewDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 09/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension DestinationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if indexPath.section == 0 { return }
//        
//        tableView.deselectRow(at: indexPath, animated: false)
//        
//        let thingStoryBoard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
//        if let thingVC = thingStoryBoard.instantiateInitialViewController() as? ThingViewController {
//            thingVC.thing = user?.things?[indexPath.row]
//            self.navigationController?.pushViewController(thingVC, animated: true)
//        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100.0
        case 1:
            return 100.0 //automatic!
        default:
            return 0.0
        }
    }
}
