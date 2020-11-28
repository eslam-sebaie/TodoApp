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
  
    
    
    func showingDeleteAlert(){
        let alertController = UIAlertController(title: "Are You Sure You Want To Delete This Item?", message: "", preferredStyle: .alert)

       
        let deleteAction = UIAlertAction(title: "Ok", style: .default, handler: { alert -> Void in
            self.todoView.activityView.isHidden = false
            self.viewModel.deleteTask(self.todoTasks[self.index].id)
           
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
