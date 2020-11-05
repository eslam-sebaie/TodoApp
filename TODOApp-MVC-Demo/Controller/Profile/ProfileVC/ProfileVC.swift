//
//  ProfileVC.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/31/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
import Kingfisher
class ProfileVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var userImageView: UIImageView!
    
    // MARK:- Variables
    var profileOfData: UserData!
    var profileDictionary = [String:String]()
    var headArray = ["Name", "Email" ,"Age"]
    var imagePicker = UIImagePickerController()
    var userID: String?
    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getProfileData()
    }
    
    // MARK:- Edit Profile Methods
    @IBAction func editPressed(_ sender: Any) {
        editProfile()
    }
    
    
    // MARK:- Logout Methods
    @IBAction func logoutPressed(_ sender: Any) {
        APIManager.postLogout {
            UserDefaultsManager.shared().token = nil
            self.present(SignInVC.create(), animated: true, completion: nil)
        }
    }

    // MARK:- Profile Data Methods
    func getProfileData(){
        APIManager.getProfile { (err, profileData) in
            self.profileOfData = profileData
            self.userID = self.profileOfData.id
            self.profileDictionary["Name"] = self.profileOfData.name
            self.profileDictionary["Email"] = self.profileOfData.email
            self.profileDictionary["Age"] = "\(self.profileOfData.age)"
            self.profileTableView.reloadData()
            self.showProfileImage()
        }        
    }

    // MARK:- Public Methods
    class func create() -> ProfileVC {
        let profileVC: ProfileVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.profileVC)
        return profileVC
    }
}
