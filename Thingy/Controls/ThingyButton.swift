//
//  ThingyLikeButton.swift
//  Thingy
//
//  Created by Filip Szukala on 03/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class ThingyButton: UIButton {

    var color: UIColor = .thingyRed()
    var selectedTextColor: UIColor = .white
    
    var isClicked: Bool {
        didSet {
            setApperance()
        }
    }
    
    override init(frame: CGRect) {
        self.isClicked = false
        
        super.init(frame: frame)
        setApperance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.isClicked = false
        
        super.init(coder: aDecoder)
        setApperance()
    }
    
    func setApperance() {
        if isClicked {
            changeToClickedApperance()
        } else {
            changeToUnClickedApperance()
        }
        
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = color.cgColor
        self.titleLabel?.textColor  = color
        self.layer.borderWidth = 0.5
    }
    
    private func changeToUnClickedApperance() {
        self.backgroundColor = .clear
        self.setTitleColor(color, for: .normal)
    }
    
    private func changeToClickedApperance() {
        self.backgroundColor = color
        self.setTitleColor(selectedTextColor, for: .normal)
    }

}
