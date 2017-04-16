//
//  OnboardingTextInputViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class OnboardingTextInputVC: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    class var storyboardID: String {
        return "OnboardingTextInputVC"
    }
    
    var type: OnboardingScreensType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let type = self.type {
            setViewControllerFor(type)
        }
    }
    
    func setViewControllerFor(_ type: OnboardingScreensType) {
        labelTitle.text = type.title
        
        switch type {
        case .Password, .PasswordAgain:
            textfield.isSecureTextEntry = true
        case .Mail:
            textfield.keyboardType = .emailAddress
        default:
            return
        }
    }

}
