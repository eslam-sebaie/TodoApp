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
    static let base = "https://api-nodejs-todolist.herokuapp.com/user"
    static let login = base + "/login"
    static let register = base + "/register"
    static let addTask = "https://api-nodejs-todolist.herokuapp.com/task"
    static let profile = base + "/me"
    static let logout = base + "/logout"
    static let postImage = base + "/me/avatar"
    
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
}
struct HeightKeys {
    static let listHeight = "todoHeight"
    static let signUpHeight = "passHeight"
}


