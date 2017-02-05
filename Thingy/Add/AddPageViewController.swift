//
//  AddPageViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class AddPageViewController: UIPageViewController {
    
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
        let addStoryboard = UIStoryboard(name: "AddStoryboard", bundle: nil)
        
        let cameraViewController = addStoryboard.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        let destinationViewController = addStoryboard.instantiateViewController(withIdentifier: "DestinationViewController") as! DestinationViewController
        let thingDetailsViewController = addStoryboard.instantiateViewController(withIdentifier: "ThingDetailsViewController") as! ThingDetailsViewController
        
        allViewControllers = [cameraViewController, destinationViewController, thingDetailsViewController]
        
        setViewControllers([allViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
}


