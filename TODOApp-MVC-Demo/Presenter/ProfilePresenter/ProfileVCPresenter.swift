//
//  ProfileVCPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit


protocol profileViewModelProtocol {
    func getProfileData()
    func editProfile(age: String)
    func logOut()
    func uploadProfileImage(_ avatar: UIImage)
    func send() -> (String,String,[String:String])
    
}

class ProfileViewModel {

    var view: ProfileVCProtocol!
    var profileDictionary = [String: String]()
    var user = ""
    var chars = ""
    init(view: ProfileVCProtocol) {
        self.view = view
    }

    private func getCharacters(name: String) -> String{
       let chars = name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
        return chars
    }
    
    private func showingImage(chars: String, id: String){
        if UserDefaultsManager.shared().imgLabel == true {
            self.view.downloadImage(with :"\(URLs.base)user/\(id)/avatar"){image in
                guard let image  = image else {
                    self.view.setLabel(charaters: chars)
                    return
                }
                self.view.setProfileView().userImageView.image = image
                self.view.viewLoader(setter: true)
            }
        }
        else {
            self.view.setLabel(charaters: chars)
        }
        let pView = self.view.setProfileView()
        pView.profileTableView.reloadData()
        
    }
}

extension ProfileViewModel: profileViewModelProtocol {
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
                self.user = result.id
                self.chars = firstCharcters
                self.showingImage(chars: firstCharcters, id: result.id)
            }
        }
    }
    
    func editProfile(age: String){
        APIManager.editProfile(age: Int(age)!) {
            self.getProfileData()
            self.view.viewLoader(setter: true)
        }
    }
    
    func logOut(){
        APIManager.logout {
            UserDefaultsManager.shared().token = nil
            self.view.switchToSignIn()
        }
    }
    
    func uploadProfileImage(_ avatar: UIImage){
        APIManager.uploadPhoto(avatar: avatar) {
            UserDefaultsManager.shared().imgLabel = true
            self.view.viewLoader(setter: true)
        }
    }
    
    func send() -> (String, String, [String : String]) {
        return (chars, user , self.profileDictionary)
    }
    
    
}

