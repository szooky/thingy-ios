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
        if let thingVC = thingStoryBoard.instantiateInitialViewController() as? ThingViewController {
            if let selectedThing = feedItems[indexPath.row].thing {
                thingVC.thing = selectedThing
            }
            self.navigationController?.pushViewController(thingVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        self.applyGradient(for: cell)
    }
    
    private func applyGradient(for cell: UITableViewCell) {
        if let feedCell = cell as? FeedTableViewCell {
            feedCell.imageViewBackground.applyThingyGradient(ofSize: feedCell.bounds)
        }
    }
}

