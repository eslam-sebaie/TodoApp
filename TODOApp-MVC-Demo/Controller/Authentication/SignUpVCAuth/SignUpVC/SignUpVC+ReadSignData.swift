//
//  SignUpVC+ReadSignData.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
extension SignUpVC: sendSignUpData {
    func setData(success: Bool) {
        if success == true {
            self.activityView.isHidden = true
            self.dismiss(animated: true, completion: nil)
        }
        else {
            self.show_Alert("Invalid Data.")
        }
    }
}
