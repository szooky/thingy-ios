//
//  OnboardingPageVC+Delegate.swift
//  Thingy
//
//  Created by Filip Szukala on 13/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension OnboardingPageVC: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed && finished, let currentVC = pageViewController.viewControllers?.last as? OnboardingTextInputVC {
            currentVC.textfield.becomeFirstResponder()
        }
    }
    
}
