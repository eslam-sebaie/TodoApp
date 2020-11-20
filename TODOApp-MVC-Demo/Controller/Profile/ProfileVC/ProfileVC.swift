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
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var imageLabel: UILabel!
    
    
    // MARK:- Variables
    var profileOfData: UserData!
    var profileDictionary = [String:String]()
    var headArray = ["Name", "Email" ,"Age"]
    var imagePicker = UIImagePickerController()
    var userID: String?
    var Chars = ""
    var presenter: ProfilePresenter!
    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getProfileData()
    }
    
    // MARK:- Edit Profile Methods
    @IBAction func editPressed(_ sender: Any) {
        editProfile()
    }
    
    
    // MARK:- Logout Methods
    @IBAction func logoutPressed(_ sender: Any) {
        presenter.logOut()
    }
    

    // MARK:- Public Methods
    class func create() -> ProfileVC {
        let profileVC: ProfileVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.profileVC)
        return profileVC
    }
}
