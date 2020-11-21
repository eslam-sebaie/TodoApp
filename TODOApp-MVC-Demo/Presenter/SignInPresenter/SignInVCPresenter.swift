//
//  SignInVCPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation

class SignInPresenter {

    weak var view: SignInVC!
    init(view: SignInVC) {
        self.view = view
    }
    
    private func valid(email:String?, password: String?) -> Bool {
        let response = Validation.shared.validate(values: (type: Validation.ValidationType.email, email!),(Validation.ValidationType.password, password!))
        switch response {
         case .success:
            return true
       
         case .failure(_, let message):
            print(message.localized())
            view.presentAlert(message.localized())
            return false
                
        }
    }
    
    
   private func login(_ email: String, _ password: String){
        APIManager.logIn(with: email, password: password) { (response) in
            switch response {
            case .failure( _):
                self.view.show_Alert("Wonge Email Or Password.")
                self.view.viewLoader(setter: true)
            case .success(let result):
                UserDefaultsManager.shared().token = result.token
                self.view.viewLoader(setter: true)
                self.view.switchToMain()
            }
        }
    }
}

extension SignInPresenter {
    func tryLogin(_ email: String, _ password: String){
        if valid(email: email, password: password) {
            self.view.viewLoader(setter: false)
            login(email, password)
        }
    }
}
