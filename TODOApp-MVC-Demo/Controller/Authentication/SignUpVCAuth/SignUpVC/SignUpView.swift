//
//  SignUpView.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var signUpDesign: UIButton!
    @IBOutlet weak var activityView: UIView!

    
    func updateUI(){
        
        nameView.setupViews(radius: 8)
        ageView.setupViews(radius: 8)
        emailView.setupViews(radius: 8)
        passView.setupViews(radius: 8)
        blurView.setupViews(radius: 16)
        signUpDesign.setupViews(radius: 8)
        activityView.setupViews(radius: 16)
        activityView.isHidden = true
    }
}
