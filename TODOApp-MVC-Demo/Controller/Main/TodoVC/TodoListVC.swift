//
//  ViewController.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class TodoListVC: UIViewController {

   
    
    @IBOutlet var todoView: TodoListView!
    var todoTasks = [AllTasks]()
    var index = 0
    var presenter: TodoPresenter!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        determineHeight(todoView.mainView, identifier: HeightKeys.listHeight, heightNumber: 50)
        todoView.updateUI()
        
    }
    // MARK:- WillAppear Method
    override func viewWillAppear(_ animated: Bool) {
        presenter.getList()
    }
    
    // MARK:- ShowProfile Method
    @IBAction func profilePressed(_ sender: Any) {
        self.present(ProfileVC.create(), animated: true, completion: nil)
    }
    
    // MARK:- Logout Method
    @IBAction func logoutPressed(_ sender: Any) {
        presenter.logOut()
    }
    
    // MARK:- Write ToDo Text Method
    @IBAction func sendPressed(_ sender: Any) {
        presenter.sendTask(todoView.todoTextField.text!)
    }
    

    // MARK:- Public Methods
    class func create() -> TodoListVC {
        let todoListVC: TodoListVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.todoListVC)
        todoListVC.presenter = TodoPresenter(view: todoListVC)
        return todoListVC
    }
}

extension TodoListVC: showTrashDelegate {
    func btnTrashTapped(cell: TodoVCTableViewCell) {
        let indexPath = todoView.todoTableView.indexPath(for: cell)
        index = indexPath!.row
        
    }
    
    
}


