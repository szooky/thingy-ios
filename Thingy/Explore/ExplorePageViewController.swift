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
    }
    
    private func configurePageViewController() {
        dataSource = self
        
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
       setViewControllers([allViewControllers[segmentControl.selectedSegmentIndex]], direction: .forward, animated: true, completion: nil)
        print("ibaction")
    }

}
