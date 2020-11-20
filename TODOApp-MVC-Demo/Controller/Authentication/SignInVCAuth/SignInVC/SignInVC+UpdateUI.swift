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
        viewLoader(setter: true)
    }
    
    func presentAlert(_ title: String) {
        show_Alert(title)
    }
    func viewLoader(setter: Bool){
        self.activityView.isHidden = setter
    }
    func switchToMain(){
        let navigationController = UINavigationController(rootViewController: TodoListVC.create())
        AppDelegate.shared().window?.rootViewController = navigationController
        
    }
    
    func loginData(){
        presenter.tryLogin(emailTextField.text!, passwordTextField.text!)
    }
    
    
    
    
    
}


