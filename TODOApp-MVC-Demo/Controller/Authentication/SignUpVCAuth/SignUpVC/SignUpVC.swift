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
    var presenter: SignUpPresenter!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView.updateUI()
    }
    
    // MARK:- SignUp Method
    @IBAction func signUpPressed(_ sender: Any) {
        presenter.trySignUp(signUpView.nameTextField.text!, signUpView.emailTextField.text!, signUpView.passwordTextField.text!, signUpView.ageTextField.text!)
    }
    // MARK:- designableFuncions
    func presentAlert(_ title: String) {
        show_Alert(title)
    }
    func viewLoader(setter: Bool){
        signUpView.activityView.isHidden = setter
    }
    func switchToSignIn(){
        let navigationController = UINavigationController(rootViewController: SignInVC.create())
        AppDelegate.shared().window?.rootViewController = navigationController
        
    }
    
    // MARK:- Public Methods
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.authentication, identifier: ViewControllers.signUpVC)
        signUpVC.presenter = SignUpPresenter(view: signUpVC)
        return signUpVC
    }
}
