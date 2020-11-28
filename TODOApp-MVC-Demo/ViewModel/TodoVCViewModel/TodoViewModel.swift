//
//  TodoPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
protocol TodoViewModelProtocol {
    func getList()
    func logOut()
    func sendTask(_ description: String?)
    func deleteTask(_ id: String)
    func sendTodo(_ description: String?)
    func sendTasks()-> [AllTasks]
}
class TodoViewModel {
    
    var view: TodoVCProtocol!
    var tasks = [AllTasks]()
    init(view: TodoVCProtocol) {
        self.view = view
    }
    
    func getList(){
        
        ListAPIManager.getTasks { (response) in
         switch response {
         case .failure( _):
            self.view.presentAlert("ERROR")
         case .success(let Task):
            self.tasks = Task.data
            self.view.viewLoader(setter: true)
            self.view.setTodoView().todoTableView.reloadData()
            }
        }
    }
    
    func logOut(){
        APIManager.logout {
            UserDefaultsManager.shared().token = nil
            self.view.switchToSignIn()
        }
    }
    
    private func msgValidation(_ description: String?) -> Bool{
        self.view.viewLoader(setter: false)
        guard let msg = description , !msg.isEmpty else {
            self.view.presentAlert("Enter Your Task.")
            return false
        }
        return true
    }
    
    func sendTask(_ description: String?){
        if msgValidation(description!) {
            sendTodo(description!)
        }
        
    }
    
    func deleteTask(_ id: String) {
        ListAPIManager.deleteTask(id: id) {
            self.getList()
        }
    }
        
    
}
extension TodoViewModel {
    func sendTodo(_ description: String?){
        ListAPIManager.addTask(description: description!) {
            self.getList()
            self.view.setTodoView().todoTextField.text = ""
        }
    }
}
extension TodoViewModel: TodoViewModelProtocol {
    func sendTasks() -> [AllTasks] {
        return tasks
    }
    
    
}
