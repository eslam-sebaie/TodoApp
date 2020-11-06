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
        userImageView.layer.borderWidth = 1
        userImageView.layer.borderColor = #colorLiteral(red: 0.9051990799, green: 0.9051990799, blue: 0.9051990799, alpha: 1)
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
        let tabGesture = UITapGestureRecognizer()
        tabGesture.addTarget(self, action: #selector(ProfileVC.openGallery(tabGesture:)))
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(tabGesture)
        activityView.setupViews(radius: 16)
        imageLabel.isHidden = true
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
                self.activityView.isHidden = true
                }
            }
        }
    
    func editProfile(){
        let alertController = UIAlertController(title: "Edit Your Age", message: "", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter New Age"
            textField.keyboardType = .numberPad
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
        imageLabel.isHidden = true
        APIManager.uploadPhoto(avatar: userImageView.image!) {
            UserDefaultsManager.shared().imgLabel = true
            print("postSuccess")
        }
        picker.dismiss(animated: false, completion: nil)
    }
}
