//
//  OnboardingDoneVC.swift
//  Thingy
//
//  Created by Filip Szukala on 16/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class OnboardingDoneVC: UIViewController {
    
    class var storyboardID: String {
        return "OnboardingDoneVC"
    }

    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        if let pageVC = self.parent as? OnboardingPageVC {
            pageVC.dismiss(animated: true, completion: nil)
        }
    }
}
