//
//  TodoPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
protocol TaskData {
    func sendTaskData(task: Task?, error:Error?)
    func successData(success: Bool)
}
class TodoPresenter {
    
    var delegate: TaskData?
    
    init(view: TaskData) {
        self.delegate = view
    }
    init() {}
    
    func getList(){
        
        ListAPIManager.getTasks { (response) in
         switch response {
         case .failure(let err):
            self.delegate?.sendTaskData(task: nil, error: err)
         case .success(let Task):
            self.delegate?.sendTaskData(task: Task, error: nil)
            }
        }
    }
    
    func sendTask(_ description: String){
        ListAPIManager.addTask(description: description) {
            self.getList()
            self.delegate?.successData(success: true)
        }
    }
    
    func deleteTask(_ id: String) {
        ListAPIManager.deleteTask(id: id) {
            self.getList()
        }
    }
        
    
}
