//
//  TodoVC+ReadData.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
extension TodoListVC: TaskData {
    func successData(success: Bool) {
        if success {
            self.todoTextField.text = ""
        }
    }
    
    func sendTaskData(task: Task?, error: Error?) {
        if error == nil {
            self.todoTasks = task!.data
                self.activityView.isHidden = true
                self.todoTableView.reloadData()
        }
        else {
            self.show_Alert("Error")
        }
    }
}
