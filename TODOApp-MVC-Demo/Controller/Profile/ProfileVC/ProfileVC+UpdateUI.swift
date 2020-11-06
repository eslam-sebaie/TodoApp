//
//  ProfileVC+UpdateUI.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/5/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
extension ProfileVC {
    func updateUI(){
        imagePicker.delegate = self
        userImageView.setupViews(radius: 60)
        userImageView.dropShadow()
        userImageView.clipsToBounds = true
        let tabGesture = UITapGestureRecognizer()
        tabGesture.addTarget(self, action: #selector(ProfileVC.openGallery(tabGesture:)))
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(tabGesture)
        activityView.setupViews(radius: 16)
    }
    @objc func openGallery(tabGesture: UITapGestureRecognizer) {
        self.setypImagePicker()
    }
    
    func showProfileImage(){
        
        APIManager.getPhoto(id: userID!) { (err, img) in
            if let err = err {
                print(err)
            }
            else {
                self.userImageView.image = img
                }
            }
        }
    
    func editProfile(){
        let alertController = UIAlertController(title: "Edit Your Age", message: "", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter New Age"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            self.activityView.isHidden = false
            let ageTF = alertController.textFields![0] as UITextField
            APIManager.editProfile(age: Int(ageTF.text!)!) { (err, success) in
                self.getProfileData()
                self.activityView.isHidden = true
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
        
}


extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setypImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        userImageView.image = image
        APIManager.uploadPhoto(avatar: userImageView.image!) {
            print("postSuccess")
        }
        picker.dismiss(animated: false, completion: nil)
    }
}
