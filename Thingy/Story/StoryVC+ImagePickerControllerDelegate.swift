//
//  StoryViewController+UIImagePickerControllerDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 06/04/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import UIKit

extension StoryViewController: UIImagePickerControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
  
        
        dismiss(animated: true, completion: nil)
    }
}
