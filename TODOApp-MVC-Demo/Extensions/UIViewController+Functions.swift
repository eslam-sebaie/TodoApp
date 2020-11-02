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
    public func show_Alert(_ title: String) {
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in}
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    func determineHeight(_ view: UIView ,identifier: String, heightNumber:Int){
          for cons in view.constraints {
             if cons.identifier == identifier
             {
                 cons.constant = CGFloat(heightNumber)
             }
         }
            view.layoutIfNeeded()
      }
    
}
