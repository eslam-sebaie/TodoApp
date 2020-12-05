//
//  AppStateManager.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 12/5/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit

protocol appStateManagerProtocol {
    func start(appDelegate: AppDelegate)
}

class AppStateManager {

    var appDelegate: AppDelegateProtocol!
    var mainWindow: UIWindow? {
        return appDelegate.getMAinWindow()
    }
    
    enum appState {
        case none
        case main
        case signIn
        case signUp
        case profile
    }
    
    var state: appState = .none{
        willSet(newValue) {
            switch newValue {
            case .main:
                switchToMainState()
            case .signIn:
                switchToSignInState()
            case .signUp:
               switchToSignUpState()
            case .profile:
                switchToProfileState()
            default:
                return
            }
        }
        
    }
    
    private static let sharedInstance = AppStateManager()
    class func shared() -> AppStateManager {
        return AppStateManager.sharedInstance
        
    }
    
}
extension AppStateManager: appStateManagerProtocol {
    func start(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
        if UserDefaultsManager.shared().token != nil {
            state = .main
            
        } else {
            state = .signIn
        }
    }
}

extension AppStateManager: goToSignUpPage {
    func switchToSignUp() {
        state = .signUp
    }
}

extension AppStateManager: gotoSignInPage {
    func switchToSignIn() {
        self.state = .signIn
    }
}

extension AppStateManager: GotoProfileScreen {
    func switchToProfile() {
        self.state = .profile
    }
}

extension AppStateManager: gotoMainPage {
    func switchToMain() {
        self.state = .main
    }
}

extension AppStateManager {
    func switchToMainState() {
        let todoListVC = TodoListVC.create()
        todoListVC.profileDelegate = self
        todoListVC.signInDelegate = self
        let navigationController = UINavigationController(rootViewController: todoListVC)
        navigationController.navigationBar.isHidden = true
        self.mainWindow?.rootViewController = navigationController
    }
    
    func switchToSignInState() {
        let signInVC = SignInVC.create()
        signInVC.delegate = self
        signInVC.signInDelegate = self
        signInVC.mainDelegate = self
        let navigationController = UINavigationController(rootViewController: signInVC)
        navigationController.navigationBar.isHidden = true
        self.mainWindow?.rootViewController = navigationController
    }
    
    func switchToProfileState() {
        let profileVC = ProfileVC.create()
        profileVC.signInDelegate = self
        let navigationController = UINavigationController(rootViewController: profileVC)
        navigationController.navigationBar.isHidden = true
        self.mainWindow?.rootViewController = navigationController
    }
    
    func switchToSignUpState() {
        let signUpVC = SignUpVC.create()
        signUpVC.signInDelegate = self
        let navigationController = UINavigationController(rootViewController: signUpVC)
        navigationController.navigationBar.isHidden = true
        self.mainWindow?.rootViewController = navigationController
    }
}
