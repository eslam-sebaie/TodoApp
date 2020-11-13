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
        presenter = SignInPresenter(view: self)
        emailView.setupViews(radius: 8)
        passView.setupViews(radius: 8)
        blurView.setupViews(radius: 16)
        signInDesign.setupViews(radius: 8)
        activityView.setupViews(radius: 16)
        activityView.isHidden = true
    }
    
    func loginData(){
        activityView.isHidden = false        
        presenter.login(emailTextField.text!, passwordTextField.text!)
    }
    
    // MARK:- Valid Method
    func valid() -> Bool{
        guard let email = emailTextField.text , !email.isEmpty else {
            show_Alert("Enter Your EmailAddress.")
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
            show_Alert("Enter Your Correct Password.")
            return false
        }
        return true
      
    }
    
    
}


