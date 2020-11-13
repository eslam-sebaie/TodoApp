//
//  profileVC+ReadData.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//


import UIKit
import Kingfisher
extension ProfileVC: ProfileData {
    func successUpload(success: Bool) {
        activityView.isHidden = true
    }
    
    
    func sendProfileData(firstChars: String?, userID: String?, _ profileDic: Dictionary<String, String>?) {
        self.profileDictionary = profileDic!
        self.userID = userID
        self.Chars = firstChars!
        if UserDefaultsManager.shared().imgLabel == true {
            downloadImage(with :"\(URLs.base)user/\(self.userID!)/avatar"){image in
                guard let image  = image else {
                    self.setLabel()
                    return
                }
                self.userImageView.image = image
                self.activityView.isHidden = true
            }
        }
        else {
            setLabel()
        }
        
        self.profileTableView.reloadData()
        
    }
    
    
    
}
