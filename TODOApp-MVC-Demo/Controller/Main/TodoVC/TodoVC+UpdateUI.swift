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
    // MARK:- UI Method
    func updateUI(){
        mainView.setupViews(radius: 16)
        mainView.dropShadow()
        determineHeight(mainView, identifier: HeightKeys.listHeight, heightNumber: 50)
        testView.isHidden = true
        mainView.bottomAnchor.constraint(equalTo: testView.topAnchor, constant: -20).isActive = true
    }
    // MARK:- GetList Method
    func getList(){
        ListAPIManager.getTasks { (err, taskes) in
            self.todoTasks = taskes
            self.todoTableView.reloadData()
            print(self.todoTasks)
        }
    }
    
}
