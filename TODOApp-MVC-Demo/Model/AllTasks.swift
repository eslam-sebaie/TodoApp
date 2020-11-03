//
//  AllTasks.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
struct AllTasks: Codable {
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case description
    }
}
