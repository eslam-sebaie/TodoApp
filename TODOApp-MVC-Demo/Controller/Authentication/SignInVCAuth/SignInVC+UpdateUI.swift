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
 
    func updateUI(){
        
        emailView.setupViews(radius: 8)
        passView.setupViews(radius: 8)
        blurView.setupViews(radius: 16)
        signInDesign.setupButtons()
    }
    
    func valid() -> Bool {
        if let email = emailTextField.text , !email.isEmpty {
            if let pass = passwordTextField.text, !pass.isEmpty {
                return true
            }
            else {
                show_Alert("Enter Your Password.")
            }
        }
        else {
            show_Alert("Enter Your Email Address.")
        }
        return false
    }
    
    
}


