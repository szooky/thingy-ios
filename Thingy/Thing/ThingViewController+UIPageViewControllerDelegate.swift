//
//  ThingViewController+UIPageViewControllerDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 13/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ThingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let itemController = pendingViewControllers[0] as? ThingGalleryViewController {
            pageControl.currentPage = itemController.imageIndex
        }
        
    }
}
