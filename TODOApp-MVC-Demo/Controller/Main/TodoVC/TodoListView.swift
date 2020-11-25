//
//  TodoListView.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class TodoListView: UIView {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var activityView: UIView!

    
    func updateUI(){
        mainView.setupViews(radius: 16)
        mainView.dropShadow()
        testView.isHidden = true
        activityView.setupViews(radius: 16)
        mainView.bottomAnchor.constraint(equalTo: testView.topAnchor, constant: -20).isActive = true
    }
}
