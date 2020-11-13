//
//  profileVC+ReadData.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//


import UIKit
extension ProfileVC: ProfileData {
    func successUpload(success: Bool) {
        activityView.isHidden = true
    }
    
    func sucessImage(error: Error?, img: UIImage?) {
        if img != nil {
            self.userImageView.image = img
            self.activityView.isHidden = true
        }
        else {
            self.activityView.isHidden = true
        }
       
    }
    
    func sendProfileData(firstChars: String?, userID: String?, _ profileDic: Dictionary<String, String>?) {
        self.profileDictionary = profileDic!
        self.userID = userID
        self.Chars = firstChars!
        if UserDefaultsManager.shared().imgLabel == true {
            self.showProfileImage()
        }
        else {
            self.activityView.isHidden = true
            self.imageLabel.isHidden = false
            self.imageLabel.text = Chars
        }
        self.profileTableView.reloadData()
        
    }
    
    
    
}
