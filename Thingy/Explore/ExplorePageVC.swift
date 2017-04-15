//
//  ExplorePageViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 06/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class ExplorePageViewController: UIPageViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    var allViewControllers = Array<UIViewController>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewControllers()
        configurePageViewController()
        
        automaticallyAdjustsScrollViewInsets = false
    }
    
    private func configurePageViewController() {
        dataSource = self
        delegate = self
    }
    
    private func loadViewControllers() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let thingsTableVC = mainStoryboard.instantiateViewController(withIdentifier: ExploreViewController.storyboardID) as! ExploreViewController
        thingsTableVC.type = .Things
        
        let storiesTableVC = mainStoryboard.instantiateViewController(withIdentifier: ExploreViewController.storyboardID) as! ExploreViewController
        storiesTableVC.type = .Stories
        
        let usersTableVC = mainStoryboard.instantiateViewController(withIdentifier: ExploreViewController.storyboardID) as! ExploreViewController
        usersTableVC.type = .Users
        
        allViewControllers = [thingsTableVC,storiesTableVC, usersTableVC]
        
        setViewControllers([allViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }

    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        var direction = UIPageViewControllerNavigationDirection.forward
        if let currentVC = self.viewControllers?.last, let currentVCIndex = allViewControllers.index(of: currentVC) {
            if segmentControl.selectedSegmentIndex < currentVCIndex {
                direction = UIPageViewControllerNavigationDirection.reverse
            }
        }
    
       setViewControllers([allViewControllers[segmentControl.selectedSegmentIndex]], direction: direction, animated: true, completion: nil)
    }
    
}
