//
//  OnboardingPageVC.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class OnboardingPageVC: UIPageViewController {

    var allViewControllers = Array<UIViewController>()
    var flowType = OnboardingFlowType.NotSet
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadVCs()
        configurePageVC()
    }
    
    private func configurePageVC() {
        dataSource = self
        delegate = self
    }
    
    private func loadVCs() {
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        
        let loginRegisterVC = onboardingStoryboard.instantiateViewController(withIdentifier: LoginRegisterVC.storyboardID) as! LoginRegisterVC
        
        let loginRegisterTypeVC = onboardingStoryboard.instantiateViewController(withIdentifier: LoginRegisterTypeVC.storyboardID) as! LoginRegisterTypeVC
        
        let usernameVC = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputVC.storyboardID) as! OnboardingTextInputVC
        usernameVC.type = .Username
        
        let passwordVC = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputVC.storyboardID) as! OnboardingTextInputVC
        passwordVC.type = .Password
        
        let retypePasswordVC = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputVC.storyboardID) as! OnboardingTextInputVC
        retypePasswordVC.type = .PasswordAgain
        
        let mailVC = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingTextInputVC.storyboardID) as! OnboardingTextInputVC
        mailVC.type = .Mail
        
        let onboardingDoneVC = onboardingStoryboard.instantiateViewController(withIdentifier: OnboardingDoneVC.storyboardID) as! OnboardingDoneVC
        
        allViewControllers = [loginRegisterVC,
                              loginRegisterTypeVC,
                              usernameVC,
                              passwordVC,
                              retypePasswordVC,
                              mailVC,
                              onboardingDoneVC]
        
        setViewControllers([allViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func goTo(onboardingScreen: OnboardingScreensType) {
        self.setViewControllers([self.allViewControllers[onboardingScreen.rawValue]],
                                              direction: .forward,
                                              animated: true,
                                              completion: nil)
    }
}
