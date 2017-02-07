//
//  OnboardingPageViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    var allViewControllers = Array<UIViewController>()
    var flowType = OnboardingFlowType.NotSet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewControllers()
        configurePageViewController()
    }
    
    private func configurePageViewController() {
        dataSource = self
    }
    
    private func loadViewControllers() {
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        
        let loginRegisterViewController = onboardingStoryboard.instantiateViewController(withIdentifier: "LoginRegisterViewController") as! LoginRegisterViewController
        
        let usernameViewController = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputViewController.storyboardID) as! OnboardingTextInputViewController
        usernameViewController.type = .username
        
        let passwordViewController = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputViewController.storyboardID) as! OnboardingTextInputViewController
        passwordViewController.type = .password
        
        let retypePasswordViewController = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputViewController.storyboardID) as! OnboardingTextInputViewController
        retypePasswordViewController.type = .passwordAgain
        
        let nameViewController = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputViewController.storyboardID) as! OnboardingTextInputViewController
        nameViewController.type = .name
        
        let surenameViewController = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputViewController.storyboardID) as! OnboardingTextInputViewController
        surenameViewController.type = .surename
        
        let mailViewController = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputViewController.storyboardID) as! OnboardingTextInputViewController
        mailViewController.type = .mail
        
        allViewControllers = [loginRegisterViewController,
                              usernameViewController,
                              passwordViewController,
                              retypePasswordViewController,
                              nameViewController,
                              surenameViewController,
                              mailViewController]
        
        setViewControllers([allViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
}
