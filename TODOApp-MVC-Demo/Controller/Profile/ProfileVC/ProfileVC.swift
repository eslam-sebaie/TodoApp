//
//  ProfileVC.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/31/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profileTableView: UITableView!
    
    var profileOfData: UserData!
    var profileDictionary = [String:String]()
    var headArray = ["Name", "Email" ,"Age"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK:- WillApear Methods
    override func viewWillAppear(_ animated: Bool) {
        getProfileData()
    }
    
    // MARK:- Logout Methods
    @IBAction func logoutPressed(_ sender: Any) {
        APIManager.postLogout {
            UserDefaultsManager.shared().token = nil
            self.present(SignInVC.create(), animated: true, completion: nil)
        }
    }

    func getProfileData(){
        APIManager.getProfile { (err, profileData) in
            self.profileOfData = profileData
            self.profileDictionary["Name"] = self.profileOfData.name
            self.profileDictionary["Email"] = self.profileOfData.email
            self.profileDictionary["Age"] = "\(self.profileOfData.age)"
            self.profileTableView.reloadData()
        }        
    }

    // MARK:- Public Methods
    class func create() -> ProfileVC {
        let profileVC: ProfileVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.profileVC)
        return profileVC
    }
}
