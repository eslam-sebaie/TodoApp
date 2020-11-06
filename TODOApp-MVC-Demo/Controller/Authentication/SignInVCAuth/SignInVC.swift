//
//  SignInVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var signInDesign: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityView: UIView!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK:- SignIn Button
    @IBAction func signInPressed(_ sender: Any) {
        if valid() {
            loginData()
        }
    }
    
    // MARK:- SignUP Button
    @IBAction func signUpPressed(_ sender: Any) {
        let signUp = SignUpVC.create()
        self.present(signUp, animated: true, completion: nil)
    }
    
    // MARK:- Public Methods
    class func create() -> SignInVC {
        let signInVC: SignInVC = UIViewController.create(storyboardName: Storyboards.authentication, identifier: ViewControllers.signInVC)
        return signInVC
    }
}




