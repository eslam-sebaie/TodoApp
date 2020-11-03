//
//  SignInVC+UpdateUI.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
extension SignInVC {
 
    // MARK:- UI Method
    func updateUI(){
        emailView.setupViews(radius: 8)
        passView.setupViews(radius: 8)
        blurView.setupViews(radius: 16)
        signInDesign.setupViews(radius: 8)
    }
    // MARK:- Valid Method
    func valid() -> Bool {
        if let email = emailTextField.text , !email.isEmpty {
            if isValidEmail(emailTextField.text!) {
              if let pass = passwordTextField.text, !pass.isEmpty {
                if isPasswordValid(passwordTextField.text!){
                 return true
              }
                show_Alert("Enter Your Correct Password.")
            }
            else {
                show_Alert("Enter Your Password.")
            }
        }
         show_Alert("Enter Your Correct Email.")
    }
        else {
            show_Alert("Enter Your Email Address.")
        }
        return false
    }
    
    
}


