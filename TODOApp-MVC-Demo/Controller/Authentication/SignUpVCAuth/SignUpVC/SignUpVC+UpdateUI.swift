//
//  SignUpVC+UpdateUI.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
extension SignUpVC {
 
    // MARK:- UI Method
    func updateUI(){
        
        nameView.setupViews(radius: 8)
        ageView.setupViews(radius: 8)
        emailView.setupViews(radius: 8)
        passView.setupViews(radius: 8)
        blurView.setupViews(radius: 16)
        signUpDesign.setupViews(radius: 8)
        passwordValidationLabel(isHidden: true, height: 0)
        activityView.setupViews(radius: 16)
        activityView.isHidden = true
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
    
    
    // MARK:- passLabel Validation Method
    func passwordValidationLabel(isHidden: Bool, height: Int) {
        passwordValidation.isHidden = isHidden
        determineHeight(passwordValidation, identifier: HeightKeys.signUpHeight, heightNumber: height)
    }
    
    func signUpData(){
        
        presenter.trySignUp(nameTextField.text!, emailTextField.text!, passwordTextField.text!, ageTextField.text!)
    }
    
    // MARK:- Validation Method
    
}
