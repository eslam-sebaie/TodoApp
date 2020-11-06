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
        activityView.setupViews(radius: 16)
        activityView.isHidden = true
    }
    
    func loginData(){
        activityView.isHidden = false
        APIManager.logIn(with: emailTextField.text!, password: passwordTextField.text!) { (error, loginData) in
            if let error = error {
                self.show_Alert("Wonge Email Or Password.")
                self.activityView.isHidden = true
                print(error.localizedDescription)
            } else if let loginData = loginData {
                UserDefaultsManager.shared().token = loginData.token
            }
            self.activityView.isHidden = true
            self.present(TodoListVC.create(), animated: true, completion: nil)
        }
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


