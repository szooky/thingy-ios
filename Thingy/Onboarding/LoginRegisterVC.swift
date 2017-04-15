//
//  LoginRegisterViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class LoginRegisterViewController: UIViewController {

    @IBAction func buttonLoginClicked(_ sender: UIButton) {
        if let pageViewController = self.parent as? OnboardingPageViewController {
            pageViewController.flowType = .Login
            nextPage(in: pageViewController)
        }
    }
 
    @IBAction func buttonRegisterClicked(_ sender: UIButton) {
        if let pageViewController = self.parent as? OnboardingPageViewController {
            pageViewController.flowType = .Register
            nextPage(in: pageViewController)
        }
    }
    
    func nextPage(in pageViewController: OnboardingPageViewController) {
        pageViewController.setViewControllers([pageViewController.allViewControllers[1]],
                                              direction: .forward,
                                              animated: true,
                                              completion: nil)
    }
    
}
