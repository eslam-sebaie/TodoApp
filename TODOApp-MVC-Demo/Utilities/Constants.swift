//
//  Constants.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation


// Storyboards
struct Storyboards {
    static let authentication = "Authentication"
    static let main = "Main"
}

// View Controllers
struct ViewControllers {
    static let signUpVC = "SignUpVC"
    static let signInVC = "SignInVC"
    static let todoListVC = "TodoListVC"
    static let profileVC = "ProfileVC"
}

// Urls
struct URLs {
    static let base = "https://api-nodejs-todolist.herokuapp.com/"
    static let login = "user/login"
    static let register = "user/register"
    static let addTask = base + "task"
    static let profile = base + "user/me"
    static let logout = "user/logout"
    static let postImage = base + "user/me/avatar"
    
}

// Header Keys
struct HeaderKeys {
    static let contentType = "Content-Type"
    static let Authorization = "Authorization"
}

// Parameters Keys
struct ParameterKeys {
    static let name = "name"
    static let age = "age"
    static let email = "email"
    static let password = "password"
    static let description = "description"
}

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "UDKToken"
    static let image = "UDKImage"
}
struct HeightKeys {
    static let listHeight = "todoHeight"
    static let signUpHeight = "passHeight"
}


