//
//  LoginRegisterTypeVC.swift
//  Thingy
//
//  Created by Filip Szukala on 16/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class LoginRegisterTypeVC: UIViewController {
    
    class var storyboardID: String {
        return "LoginRegisterTypeVC"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var normalWayButton: UIButton!
    
    @IBAction func facebookButtonClicked(_ sender: Any) {
        if let pageVC = self.parent as? OnboardingPageVC {
            if pageVC.flowType == .Login {
                pageVC.flowType = .LoginFacebook
            } else {
                pageVC.flowType = .RegisterFacebook
            }
            pageVC.goTo(onboardingScreen: .Done)
        }
    }
    
    @IBAction func twitterButtonClicked(_ sender: Any) {
        if let pageVC = self.parent as? OnboardingPageVC {
            if pageVC.flowType == .Login {
                pageVC.flowType = .LoginTwitter
            } else {
                pageVC.flowType = .RegisterTwitter
            }
            pageVC.goTo(onboardingScreen: .Done)
        }
    }
    
    @IBAction func googleButtonClicked(_ sender: Any) {
        if let pageVC = self.parent as? OnboardingPageVC {
            if pageVC.flowType == .Login {
                pageVC.flowType = .LoginGoogle
            } else {
                pageVC.flowType = .RegisterGoogle
            }
            pageVC.goTo(onboardingScreen: .Done)
        }
    }
    
    @IBAction func normalWayButtonClicked(_ sender: Any) {
        if let pageVC = self.parent as? OnboardingPageVC {
            if pageVC.flowType == .Login {
                pageVC.flowType = .Login
            } else {
                pageVC.flowType = .Register
            }
            pageVC.goTo(onboardingScreen: .Username)
        }
    }
}
