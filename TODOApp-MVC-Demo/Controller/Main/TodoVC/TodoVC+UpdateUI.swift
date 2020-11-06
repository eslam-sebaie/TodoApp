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
        activityView.setupViews(radius: 16)
        mainView.bottomAnchor.constraint(equalTo: testView.topAnchor, constant: -20).isActive = true
        
    }
    // MARK:- GetList Method
    func getList(){
        ListAPIManager.getTasks { (err, taskes) in
            self.todoTasks = taskes
            self.activityView.isHidden = true
            self.todoTableView.reloadData()
            
        }
    }
    func showingDeleteAlert(){
        let alertController = UIAlertController(title: "Are You Sure You Want To Delete This Item?", message: "", preferredStyle: .alert)

       
        let deleteAction = UIAlertAction(title: "Ok", style: .default, handler: { alert -> Void in
            self.activityView.isHidden = false
            ListAPIManager.deleteTask(id: self.todoTasks[self.index].id) {
                self.getList()
                self.activityView.isHidden = true
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
