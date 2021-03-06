//
//  TodoVC+TableView.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
extension TodoListVC: UITableViewDataSource {
    // MARK:- TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoTasks = viewModel.sendTasks()
        determineHeight(todoView.mainView, identifier: HeightKeys.listHeight, heightNumber: 50 + (todoTasks.count * 60))
      
        return todoTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoView.todoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoVCTableViewCell
        cell.delegate = self
        cell.todaLabel.text = todoTasks[indexPath.row].description
        cell.todoImage.image = UIImage(named: "todolist")
        
        cell.todoDesign.addTarget(self, action: #selector(trashPressed(sender:)), for: .touchUpInside)
        return cell
    }
    @objc func trashPressed(sender: UIButton){
        showingDeleteAlert()
    }
}



