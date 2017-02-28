//
//  AddPageViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit
//import YangMingShan

class AddPageViewController: UIPageViewController {
    
    var allViewControllers = Array<UIViewController>()
    var pickedImages: NSArray! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewControllers()
        configurePageViewController()
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func configurePageViewController() {
        dataSource = self
    }
    
    private func loadViewControllers() {
        let addStoryboard = UIStoryboard(name: "AddStoryboard", bundle: nil)
        
        let pickerViewController = YMSPhotoPickerViewController.init()
        self.setPhotoPicker(pickerViewController)

        let destinationViewController = addStoryboard.instantiateViewController(withIdentifier: "DestinationViewController") as! DestinationViewController
        let thingDetailsViewController = addStoryboard.instantiateViewController(withIdentifier: "ThingDetailsViewController") as! ThingDetailsViewController
        
        allViewControllers = [pickerViewController, destinationViewController, thingDetailsViewController]
        
        setViewControllers([allViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
}
