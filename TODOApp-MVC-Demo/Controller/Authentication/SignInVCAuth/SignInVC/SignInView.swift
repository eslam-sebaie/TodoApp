//
//  SignInView.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class SignInView: UIView {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var signInDesign: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityView: UIView!

    
    func updateUI(){
        emailView.setupViews(radius: 8)
        passView.setupViews(radius: 8)
        blurView.setupViews(radius: 16)
        signInDesign.setupViews(radius: 8)
        activityView.setupViews(radius: 16)
    }
    
}
