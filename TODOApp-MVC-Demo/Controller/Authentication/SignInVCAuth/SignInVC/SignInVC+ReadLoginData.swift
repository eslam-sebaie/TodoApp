//
//  SignInVC+ReadLoginData.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
extension SignInVC: sendSignInData {
    func setData(_ result: LoginResponse?, _ error: Error?) {
        if error != nil {
            self.show_Alert("Wonge Email Or Password.")
        }
        else {
            UserDefaultsManager.shared().token = result?.token
            self.activityView.isHidden = true
            self.present(TodoListVC.create(), animated: true, completion: nil)
        }
    }
}
