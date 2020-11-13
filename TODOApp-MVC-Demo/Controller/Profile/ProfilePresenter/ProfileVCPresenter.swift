//
//  ProfileVCPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
protocol ProfileData {
    func sendProfileData(firstChars: String? ,userID: String?, _ profileDic:Dictionary<String, String>?)
    func successUpload(success: Bool)
    
}
class ProfilePresenter {
    
    var delegate: ProfileData?
    var profileDictionary = [String: String]()
    
    init(view: ProfileData) {
        self.delegate = view
    }
    init() {}
    
  
    func getProfileData(){
        
        APIManager.getProfile { (response) in
            switch response {
            case .failure(let error):
                
                print(error.localizedDescription)
            case .success(let result):
                self.profileDictionary["Name"] = result.name
                self.profileDictionary["Email"] = result.email
                self.profileDictionary["Age"] = "\(result.age)"
                let firstCharcters = self.getCharacters(name: result.name)
                self.delegate?.sendProfileData(firstChars: firstCharcters,userID: result.id, self.profileDictionary)
            }
        }
    }
    
    func uploadProfileImage(_ avatar: UIImage){
        APIManager.uploadPhoto(avatar: avatar) {
            UserDefaultsManager.shared().imgLabel = true
            self.delegate?.successUpload(success: true)
        }
    }
    
    func getCharacters(name: String) -> String{
       let chars = name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
        return chars
    }
}
