//
//  SignUpVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
 
    @IBOutlet var signUpView: SignUpView!
    var viewModel: SignUpVCViewModelProtocol!
    weak var signInDelegate: gotoSignInPage?
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView.updateUI()
    }
    
    // MARK:- SignUp Method
    @IBAction func signUpPressed(_ sender: Any) {
        viewModel.trySignUp(signUpView.nameTextField.text!, signUpView.emailTextField.text!, signUpView.passwordTextField.text!, signUpView.ageTextField.text!)
    }

    
    // MARK:- Public Methods
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.authentication, identifier: ViewControllers.signUpVC)
        signUpVC.viewModel = SignUpViewModel(view: signUpVC)
        return signUpVC
    }
}

extension SignUpVC: AuthVCProtocol{
    func switchToMain() {
        self.signInDelegate?.switchToSignIn()
    }
    
    func viewLoader(setter: Bool){
        signUpView.activityView.isHidden = setter
    }

    func presentAlert(_ title: String) {
        show_Alert(title)
    }
}
