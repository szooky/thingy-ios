//
//  OboardingTextInputType.swift
//  Thingy
//
//  Created by Filip Szukala on 05/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

protocol OnboardingScreensEnum  {
    var title: String { get }
}

enum OnboardingScreensType : Int, OnboardingScreensEnum {
    case LoginOrRegister = 0
    case OnboardingTypeSelection = 1
    case Username = 2
    case Password = 3
    case PasswordAgain = 4
    case Mail = 5
    case Done = 6
    
    var title: String {
        switch self {
            case .Username: return "username"
            case .Password: return "password"
            case .PasswordAgain: return "retype password"
            case .Mail: return "mail"
            default: return ""
        }
    }
}
