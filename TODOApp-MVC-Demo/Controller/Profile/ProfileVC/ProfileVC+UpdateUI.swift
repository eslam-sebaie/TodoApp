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
    func updateUI(){
        presenter = ProfilePresenter(view: self)
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
    
    func presentAlert(_ title: String) {
        show_Alert(title)
    }
    func viewLoader(setter: Bool){
        self.activityView.isHidden = setter
    }
    func switchToSignIn(){
        let navigationController = UINavigationController(rootViewController: SignInVC.create())
        AppDelegate.shared().window?.rootViewController = navigationController
        
    }
    
    @objc func openGallery(tabGesture: UITapGestureRecognizer) {
        self.setypImagePicker()
    }
    

    func editProfile(){
        presentEditAlert(title: "Edit Your Age", tfPlaceHolder: "Enter New Age", actionTitle: "Save") { (age) in
            self.activityView.isHidden = false
            self.presenter.editProfile(age: age)
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
    
    func downloadImage(with urlString : String , imageCompletionHandler: @escaping (UIImage?) -> Void){
            guard let url = URL.init(string: urlString) else {
                return  imageCompletionHandler(nil)
            }
            let resource = ImageResource(downloadURL: url)
            
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    imageCompletionHandler(value.image)
                case .failure:
                    imageCompletionHandler(nil)
                }
            }
        }
    
    func setLabel(charaters: String){
        self.activityView.isHidden = true
        self.imageLabel.isHidden = false
        self.imageLabel.text = charaters
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
            activityView.isHidden = false
            presenter.uploadProfileImage(userImageView.image!)
            picker.dismiss(animated: false, completion: nil)
        }
}
