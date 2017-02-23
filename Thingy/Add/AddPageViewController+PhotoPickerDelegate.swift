//
//  AddPageViewController+PhotoPickerDelegate.swift
//  Thingy
//
//  Created by Filip Szukala on 23/02/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation
import YangMingShan

extension AddPageViewController: YMSPhotoPickerViewControllerDelegate {
    
    func setPhotoPicker(_ picker: YMSPhotoPickerViewController) {
        picker.numberOfPhotoToSelect = 10
        
        let themeColor = UIColor.thingyOrange()
        let cameraColor = UIColor.thingyOrange()
        
        picker.theme.titleLabelTextColor = UIColor.white
        picker.theme.navigationBarBackgroundColor = UIColor.thingyGrey()
        picker.navigationController?.navigationBar.barStyle = .blackTranslucent
        
        picker.theme.tintColor = UIColor.white
        picker.theme.orderTintColor = cameraColor
        picker.theme.cameraVeilColor = cameraColor
        picker.theme.cameraIconColor = UIColor.white
        picker.theme.statusBarStyle = .lightContent
        
    }
    
    func photoPickerViewControllerDidReceivePhotoAlbumAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController(title: "Allow photo album access?", message: "Need your permission to access photo albums", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func photoPickerViewControllerDidReceiveCameraAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController(title: "Allow camera album access?", message: "Need your permission to take a photo", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)
        
        // The access denied of camera is always happened on picker, present alert on it to follow the view hierarchy
        picker.present(alertController, animated: true, completion: nil)
    }
    
    func photoPickerViewController(_ picker: YMSPhotoPickerViewController!, didFinishPickingImages photoAssets: [PHAsset]!) {
        // Remember images you get here is PHAsset array, you need to implement PHImageManager to get UIImage data by yourself
        picker.dismiss(animated: true) {
            let imageManager = PHImageManager.init()
            let options = PHImageRequestOptions.init()
            options.deliveryMode = .highQualityFormat
            options.resizeMode = .exact
            options.isSynchronous = true
            
            let mutableImages: NSMutableArray! = []
            
            //            for asset: PHAsset in photoAssets
            //            {
            //                let scale = UIScreen.main.scale
            //                let targetSize = CGSize(width: (self.collectionView.bounds.width - 20*2) * scale, height: (self.collectionView.bounds.height - 20*2) * scale)
            //                imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options, resultHandler: { (image, info) in
            //                    mutableImages.add(image!)
            //                })
            //            }
            //            // Assign to Array with images
            //            self.images = mutableImages.copy() as? NSArray
        }
    }

}
