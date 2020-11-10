//
//  SignUpVC+UpdateUI.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
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
    // MARK:- passLabel Validation Method
    func passwordValidationLabel(isHidden: Bool, height: Int) {
        passwordValidation.isHidden = isHidden
        determineHeight(passwordValidation, identifier: HeightKeys.signUpHeight, heightNumber: height)
    }
    
    func signUpData(){
        activityView.isHidden = false
        APIManager.signUp(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, age: Int(ageTextField.text!)!){ (response) in
            self.activityView.isHidden = true
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK:- Validation Method
    func valid() -> Bool {
        
        guard let name = nameTextField.text , !name.isEmpty else {
            show_Alert("Enter Your Name.")
            return false
        }
        
        guard let email = emailTextField.text , !email.isEmpty else {
            show_Alert("Enter Your Email Address.")
            return false
        }
        guard isValidEmail(email) else {
            show_Alert("Enter Your Correct Email.")
            return false
        }
        guard let pass = passwordTextField.text, !pass.isEmpty else {
            show_Alert("Enter Your Password.")
            return false
        }
        guard isPasswordValid(pass) else {
            passwordValidationLabel(isHidden: false, height: 12)
            show_Alert("Enter Your Correct Password.")
            return false
        }
        guard let age = ageTextField.text, !age.isEmpty else {
            passwordValidationLabel(isHidden: true, height: 0)
            show_Alert("Enter Your Age.")
            return false
        }
        passwordValidationLabel(isHidden: true, height: 0)
        return true
    }
}
