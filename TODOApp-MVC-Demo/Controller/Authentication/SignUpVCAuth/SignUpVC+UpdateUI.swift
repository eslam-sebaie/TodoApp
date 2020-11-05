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
    }
    // MARK:- passLabel Validation Method
    func passwordValidationLabel(isHidden: Bool, height: Int) {
        passwordValidation.isHidden = isHidden
        determineHeight(passwordValidation, identifier: HeightKeys.signUpHeight, heightNumber: height)
    }
    
    // MARK:- Validation Method
    func valid() -> Bool{
        if let name = nameTextField.text , !name.isEmpty {
            if let email = emailTextField.text , !email.isEmpty {
                if isValidEmail(emailTextField.text!) {
                    if let pass = passwordTextField.text , !pass.isEmpty {
                        if isPasswordValid(passwordTextField.text!) {
                            if let age = ageTextField.text, !age.isEmpty {
                                passwordValidationLabel(isHidden: true, height: 0)
                               return true
                            }
                            else {
                                passwordValidationLabel(isHidden: true, height: 0)
                                show_Alert("Enter Your Age.")
                            }
                        }
                        else {
                            passwordValidationLabel(isHidden: false, height: 12)
                        }
                    }
                    else {
                        show_Alert("Enter Your Password.")
                    }
                }
                else {
                    show_Alert("Enter Your Correct Email Address.")
                }
            }
            else {
                show_Alert("Enter Your Email Address.")
            }
        }
        else {
            show_Alert("Enter Your Name.")
        }
        return false
    }
}
