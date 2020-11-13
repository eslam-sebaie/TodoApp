//
//  SignUpVCPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation

protocol sendSignUpData {
    func setData(success: Bool)
}
class SignUpPresenter {
    
    var delegate: sendSignUpData?
    
    init(view: sendSignUpData) {
        self.delegate = view
    }
    init() {}

    
    func signUp(_ name: String,_ email: String, _ password: String, _ age:Int){
    
        APIManager.signUp(name: name, email: email, password: password, age: age) { (err, success) in
            self.delegate?.setData(success: success)
        }
    }
}
