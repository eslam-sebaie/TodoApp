//
//  ViewController.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class TodoListVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var activityView: UIView!
    
    var todoTasks = [AllTasks]()
    var index = 0
    
    var presenter: TodoPresenter!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
         updateUI()
        
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
        presenter.sendTask(todoTextField.text!)
    }
    

    // MARK:- Public Methods
    class func create() -> TodoListVC {
        let todoListVC: TodoListVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.todoListVC)
        return todoListVC
    }
}

extension TodoListVC: showTrashDelegate {
    func btnTrashTapped(cell: TodoVCTableViewCell) {
        let indexPath = self.todoTableView.indexPath(for: cell)
        index = indexPath!.row
        
    }
    
    
}


