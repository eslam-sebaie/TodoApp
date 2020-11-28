//
//  ProfileVC+UpdateUI.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/5/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//


import UIKit
import Kingfisher
extension ProfileVC {
   
    @objc func openGallery(tabGesture: UITapGestureRecognizer) {
        self.setypImagePicker()
    }
    

    func editProfile(){
        presentEditAlert(title: "Edit Your Age", tfPlaceHolder: "Enter New Age", actionTitle: "Save") { (age) in
            self.profileView.activityView.isHidden = false
            self.viewModel.editProfile(age: age)
        }
    }
    
    
    func presentEditAlert(title: String, tfPlaceHolder: String, actionTitle: String, completion: @escaping(_ age: String) -> ()){
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = tfPlaceHolder
            textField.keyboardType = .numberPad
        }
        let saveAction = UIAlertAction(title: actionTitle, style: .default, handler: { alert -> Void in
            let ageTF = alertController.textFields![0] as UITextField
            completion(ageTF.text ?? "0")
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
        profileView.userImageView.image = image
        profileView.imageLabel.isHidden = true
        profileView.activityView.isHidden = false
        viewModel.uploadProfileImage(profileView.userImageView.image!)
            picker.dismiss(animated: false, completion: nil)
        }
}
