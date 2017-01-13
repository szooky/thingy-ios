//
//  ThingViewController+UIPageViewControllerDataSource.swift
//  Thingy
//
//  Created by Filip Szukala on 12/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension ThingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let imagePage = viewController as! ThingGalleryViewController
        
        if imagePage.imageIndex > 0 {
            return getItemController(itemIndex: imagePage.imageIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        let imagePage = viewController as! ThingGalleryViewController
        
        if imagePage.imageIndex + 1 < contentImages.count {
            return getItemController(itemIndex: imagePage.imageIndex + 1)
        }
        
        return nil
    }
    
    func getItemController(itemIndex: Int) -> ThingGalleryViewController? {
        
        if itemIndex < contentImages.count {
            let storyboard = UIStoryboard(name: "ThingStoryboard", bundle: nil)
            let pageItemController = storyboard.instantiateViewController(withIdentifier: "ThingGalleryViewController") as! ThingGalleryViewController
            pageItemController.imageIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    // MARK: - Additions
    
    func currentControllerIndex() -> Int {
        
        let pageItemController = self.currentController()
        
        if let controller = pageItemController as? ThingGalleryViewController {
            return controller.imageIndex
        }
        
        return -1
    }
    
    func currentController() -> UIViewController? {
        
        if let count = self.pageViewController?.viewControllers?.count, count > 0 {
            return self.pageViewController?.viewControllers![0]
        }
        
        return nil
    }
    
    
}

