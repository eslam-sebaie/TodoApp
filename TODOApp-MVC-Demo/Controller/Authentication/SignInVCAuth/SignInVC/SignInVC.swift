//
//  SignInVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
@objc protocol AuthVCProtocol {
    @objc optional func viewLoader(setter: Bool)
    func presentAlert(_ title: String)
    func switchToMain()
}

protocol gotoSignInPage: class {
    func switchToSignIn()
}

protocol gotoMainPage: class {
    func switchToMain()
}

protocol goToSignUpPage: class {
    func switchToSignUp()
}

protocol GotoProfileScreen: class {
    func switchToProfile()
}

class SignInVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet var signInView: SignInView!
    
    var viewModel: signInViewModelProtocol!

    weak var delegate: goToSignUpPage?
    
    weak var signInDelegate: gotoSignInPage?
    
    weak var mainDelegate: gotoMainPage?
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.updateUI()
        viewLoader(setter: true)
    }
    
    // MARK:- SignIn Button
    @IBAction func signInPressed(_ sender: Any) {
        viewModel.tryLogin(signInView.emailTextField.text!, signInView.passwordTextField.text!)
    }
    
    
    // MARK:- SignUP Button
    @IBAction func signUpPressed(_ sender: Any) {
        self.delegate?.switchToSignUp()
    }
   
    
    // MARK:- Public Methods
    class func create() -> SignInVC {
        let signInVC: SignInVC = UIViewController.create(storyboardName: Storyboards.authentication, identifier: ViewControllers.signInVC)
        signInVC.viewModel = SignInViewModel(view: signInVC)
        return signInVC
    }
}

extension SignInVC: AuthVCProtocol{
    
    
    func viewLoader(setter: Bool){
        signInView.activityView.isHidden = setter
    }

    func presentAlert(_ title: String) {
        show_Alert(title)
    }

    func switchToMain(){
        self.mainDelegate?.switchToMain()
//        let navigationController = UINavigationController(rootViewController: TodoListVC.create())
//        AppDelegate.shared().window?.rootViewController = navigationController
    }
}





