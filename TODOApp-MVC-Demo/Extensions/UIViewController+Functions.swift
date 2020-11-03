//
//  UIViewController+Storyboard.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    // MARK:- Public Alert Method
    public func show_Alert(_ title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in}
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    // MARK:- Public Height Methods
    func determineHeight(_ view: UIView ,identifier: String, heightNumber:Int){
          for cons in view.constraints {
             if cons.identifier == identifier
             {
                 cons.constant = CGFloat(heightNumber)
             }
         }
            view.layoutIfNeeded()
      }
    
    // MARK:- Email & Password Validation Methods
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z.]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email) {
            return true
        }
            
        else {
            return false
        }
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        let passRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",passRegEx)
        if passwordTest.evaluate(with: password){
            return true
        }
        else {
            return false
        }
    }

}
