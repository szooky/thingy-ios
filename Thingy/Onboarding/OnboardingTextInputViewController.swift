//
//  OnboardingTextInputViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class OnboardingTextInputViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    class var storyboardID: String {
        return "OnboardingTextInputViewController"
    }
    
    var type: OnboardingTextInputType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let type = self.type {
            setViewControllerFor(type)
        }
        
       // self.disablesAutomaticKeyboardDismissal = true
        
        textfield.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        
//        textfield.becomeFirstResponder()
    }

    
    func setViewControllerFor(_ type: OnboardingTextInputType) {
        
        labelTitle.text = type.rawValue
        
        switch type {
        case .password, .passwordAgain:
            textfield.isSecureTextEntry = true
        case .mail:
            textfield.keyboardType = .emailAddress
        default:
            return
        }
    }

}
