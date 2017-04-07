//
//  ExplorePageVC+Delegate.swift
//  Thingy
//
//  Created by Filip Szukala on 08/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ExplorePageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed && finished, let currentVC = pageViewController.viewControllers?.last, let index = allViewControllers.index(of: currentVC) {
                segmentControl.selectedSegmentIndex = index
        }
    }
    
}
