//
//  SignUpVC+UpdateUI.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
extension SignUpVC {
 
    func updateUI(){
        
        nameView.setupViews(radius: 8)
        ageView.setupViews(radius: 8)
        emailView.setupViews(radius: 8)
        passView.setupViews(radius: 8)
        blurView.setupViews(radius: 16)
        signUpDesign.setupButtons()
        
    }
    
    
    
    
    func valid() -> Bool {
        if let name = nameTextField.text , !name.isEmpty {
            if let email = emailTextField.text , !email.isEmpty {
                if let pass = passwordTextField.text , !pass.isEmpty {
                    if let age = ageTextField.text, !age.isEmpty {
                        return true
                    }
                    else {
                        show_Alert("Enter Your Age.")
                    }
                }
                else {
                    show_Alert("Enter Your Password.")
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
