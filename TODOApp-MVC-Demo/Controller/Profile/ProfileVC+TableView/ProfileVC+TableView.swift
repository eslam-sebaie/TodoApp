//
//  ProfileVC+TableView.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/31/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
extension ProfileVC: UITableViewDataSource{
    // MARK:- TableView DataSource Methods
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileView.profileTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
     
        tupe = viewModel.send()
        let dic = tupe.2
        cell.profileView.setupViews(radius: 16)
        cell.profileView.dropShadow()
        let header = headArray[indexPath.row]
        cell.nameLabel.text = header
        cell.profileData.text = dic[header]
        return cell
    }
    
    
    
}

