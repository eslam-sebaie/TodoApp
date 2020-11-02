//
//  TodoVC+UpdateUI.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
extension TodoListVC {
    
    func updateUI(){
        mainView.setupViews(radius: 16)
        mainView.dropShadow()
        determineHeight(mainView, identifier: HeightKeys.listHeight, heightNumber: 50)
    }
    func getList(){
        ListAPIManager.getTasks { (err, taskes) in
            self.todoTasks = taskes
            self.todoTableView.reloadData()
        }
    }
    
}
