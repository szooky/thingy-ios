//
//  LoginRegisterViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class LoginRegisterVC: UIViewController {

    class var storyboardID: String {
        return "LoginRegisterVC"
    }
    
    @IBAction func buttonLoginClicked(_ sender: UIButton) {
        if let pageVC = self.parent as? OnboardingPageVC {
            pageVC.flowType = .Login
            nextPage(in: pageVC)
        }
    }
 
    @IBAction func buttonRegisterClicked(_ sender: UIButton) {
        if let pageVC = self.parent as? OnboardingPageVC {
            pageVC.flowType = .Register
            nextPage(in: pageVC)
        }
    }
    
    func nextPage(in pageViewController: OnboardingPageVC) {
        pageViewController.setViewControllers([pageViewController.allViewControllers[1]],
                                              direction: .forward,
                                              animated: true,
                                              completion: nil)
    }

    
}
