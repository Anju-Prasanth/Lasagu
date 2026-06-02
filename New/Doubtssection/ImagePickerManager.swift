//
//  ImagePickerManager.swift
//  Lasagu
//
//  Created by Arun Vijayan on 01/02/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import Foundation
import UIKit


class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
    
    override init(){
        super.init()
        self.picker.allowsEditing = true
    }
    
    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            print("device dont have a camera")
        }
    }
    
    func openGallery() {
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // For Swift 4.2
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image.fixOrientation())
    }
    
}

extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let normalizedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let compressData = normalizedImage.jpegData(compressionQuality: 0.1)
        let compressedImage = UIImage(data: compressData!)
        
        return compressedImage!
    }
}

