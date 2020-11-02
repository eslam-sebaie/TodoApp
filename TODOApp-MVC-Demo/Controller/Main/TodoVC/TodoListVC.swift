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
    @IBOutlet weak var todoTableView: UITableView!
    
    @IBOutlet weak var todoTextField: UITextField!
    
    
    var todoTasks = [AllTasks]()
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
         updateUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getList()
    }
    
    
    @IBAction func profilePressed(_ sender: Any) {
        self.present(ProfileVC.create(), animated: true, completion: nil)
    }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        self.present(SignInVC.create(), animated: true, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        guard let msg = todoTextField.text , !msg.isEmpty else {
            show_Alert("Enter Your Task.")
            return
        }
        ListAPIManager.postTask(description: todoTextField.text!) { [self] in
            self.getList()
            self.todoTextField.text = ""
        }
    }
    

    // MARK:- Public Methods
    class func create() -> TodoListVC {
        let todoListVC: TodoListVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.todoListVC)
        return todoListVC
    }
}



