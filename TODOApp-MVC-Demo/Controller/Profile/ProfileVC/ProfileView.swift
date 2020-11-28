//
//  ProfileView.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var imageLabel: UILabel!
  
    func updateUI(){
        
        userImageView.setupViews(radius: 60)
        userImageView.dropShadow()
        userImageView.layer.borderWidth = 1
        userImageView.layer.borderColor = #colorLiteral(red: 0.9051990799, green: 0.9051990799, blue: 0.9051990799, alpha: 1)
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
        
        activityView.setupViews(radius: 16)
        imageLabel.isHidden = true
    }

}
