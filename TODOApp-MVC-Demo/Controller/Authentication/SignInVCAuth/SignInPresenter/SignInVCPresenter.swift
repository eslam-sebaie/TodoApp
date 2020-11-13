//
//  SignInVCPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
protocol sendSignInData {
    func setData(_ result: LoginResponse?, _ error: Error?)
}
class SignInPresenter {
    
    var delegate: sendSignInData?
    
    init(view: sendSignInData) {
        self.delegate = view
    }
    init() {}
    func login(_ email: String, _ password: String){
        APIManager.logIn(with: email, password: password) { (response) in
            switch response {
            case .failure(let error):
                self.delegate?.setData(nil, error)
                print(error.localizedDescription)
            case .success(let result):
                self.delegate?.setData(result, nil)
            }
        }
    }
}
