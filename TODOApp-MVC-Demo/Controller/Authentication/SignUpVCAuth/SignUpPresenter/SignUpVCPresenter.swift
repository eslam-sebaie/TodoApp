//
//  SignUpVCPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation

class SignUpPresenter {
    
    var view: SignUpVC!
    
    init(view: SignUpVC) {
        self.view = view
    }
    
    func valid(name: String?, email:String?, password: String?, age: String?) -> Bool {
        let response = Validation.shared.validate(values: (type: Validation.ValidationType.alphabeticString, name!),(Validation.ValidationType.email, email!),(Validation.ValidationType.password, password!),(Validation.ValidationType.age, age!))
        switch response {
         case .success:
            return true
       
         case .failure(_, let message):
            print(message.localized())
            view.presentAlert(message.localized())
            return false
                
        }
    }

    
    func trySignUp(_ name: String,_ email: String, _ password: String, _ age:String){
        if valid(name: name, email: email, password: password, age: age) {
            self.view.viewLoader(setter: false)
            signUp(name, email, password, age)
        }
       
    }
}
extension SignUpPresenter {
     func signUp(_ name: String,_ email: String, _ password: String, _ age:String){
        APIManager.signUp(name: name, email: email, password: password, age: Int(age)!) { (err, success) in
            if err != nil {
                self.view.presentAlert("InvalidData.")
                self.view.viewLoader(setter: true)
            }
            else {
                self.view.viewLoader(setter: true)
                self.view.switchToSignIn()
            }
        }
    }
}
