//
//  ThingGalleryViewController.swift
//  Thingy
//
//  Created by Filip Szukala on 12/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

class ThingGalleryViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView?
    
    var imageIndex: Int = 0
    var imageName: String = "" {
        didSet{
            if let imageView = self.imageView {
                imageView.image = UIImage(named: imageName)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView!.image = UIImage(named: imageName)

    }



}
