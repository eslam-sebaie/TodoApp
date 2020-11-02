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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        determineHeight(mainView, identifier: HeightKeys.listHeight, heightNumber: 50 + (todoTasks.count * 60))
        return todoTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoVCTableViewCell
        cell.todaLabel.text = todoTasks[indexPath.row].description
        cell.todoImage.image = UIImage(named: "todolist")
        return cell
    }
    
    
}
extension TodoListVC: UITableViewDelegate {}

