//
//  ThingViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 11/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class ThingViewController: UIViewController {

    var thing: Thing?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        configurePageViewController()
        configurePageControl()
    }
    
    @IBOutlet weak var containerView: UIView!
    var pageViewController: UIPageViewController?
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    let contentImages = ["black_gold_amg",
                            "black_gold_amg",
                            "black_gold_amg",
                            "black_gold_amg"]

    private func configurePageViewController() {
        let storyboard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
        let pageController = storyboard.instantiateViewController(withIdentifier: "ThingGalleryPageViewController") as! UIPageViewController
        pageController.dataSource = self
        pageController.delegate = self
        
        if contentImages.count > 0 {
            let firstController = getItemController(itemIndex: 0)!
            let startingViewControllers = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController

        addChildViewController(pageViewController!)
        pageViewController!.view.frame = containerView.frame
        
        self.containerView.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
    }
    
    private func configurePageControl() {
        pageControl.numberOfPages = contentImages.count
        pageControl.currentPage = 0
    }
    
}
