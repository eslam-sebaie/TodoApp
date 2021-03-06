//
//  UserData.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
struct UserData: Codable {
    
    var id: String
    var name, email: String
    var age: Int
    
    
    enum CodingKeys: String, CodingKey {
        case age, name, email
        case id = "_id"
        
    }
}


struct UserData1: Codable {
    
 
    var name, email, password: String
    var age: Int
    
    
    enum CodingKeys: String, CodingKey {
        case age, name, email, password
    
        
    }
}


struct uploadImage: Codable {
    var img: Data
    
    enum CodingKeys: String, CodingKey {
        case img
    }
}


