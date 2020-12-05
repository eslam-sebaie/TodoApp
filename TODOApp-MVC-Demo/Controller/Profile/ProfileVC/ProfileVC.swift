//
//  ProfileVC.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/31/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
import Kingfisher
protocol ProfileVCProtocol {
    func viewLoader(setter: Bool)
    func presentAlert(_ title: String)
    func switchToSignIn()
    func downloadImage(with urlString : String , imageCompletionHandler: @escaping (UIImage?) -> Void)
    func setLabel(charaters: String)
    func setProfileView() -> ProfileView

}


class ProfileVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var profileView: ProfileView!
    // MARK:- Variables
    var profileOfData: UserData!
    var profileDictionary = [String:String]()
    var headArray = ["Name", "Email" ,"Age"]
    var imagePicker = UIImagePickerController()
    var userID: String?
    var Chars = ""
    var viewModel: profileViewModelProtocol!
    var tupe: (String, String, [String:String]) = ("","",[:])
    
    weak var signInDelegate: gotoSignInPage?
    // MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        let tabGesture = UITapGestureRecognizer()
        tabGesture.addTarget(self, action: #selector(ProfileVC.openGallery(tabGesture:)))
        profileView.userImageView.isUserInteractionEnabled = true
        profileView.userImageView.addGestureRecognizer(tabGesture)
        profileView.updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getProfileData()
    }
    
    // MARK:- Edit Profile Methods
    @IBAction func editPressed(_ sender: Any) {
        editProfile()
    }
    
    
    // MARK:- Logout Methods
    @IBAction func logoutPressed(_ sender: Any) {
        viewModel.logOut()
    }
    

    // MARK:- Public Methods
    class func create() -> ProfileVC {
        let profileVC: ProfileVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.profileVC)
        profileVC.viewModel = ProfileViewModel(view: profileVC)
       
        return profileVC
    }
}


extension ProfileVC: ProfileVCProtocol{

    func presentAlert(_ title: String) {
        show_Alert(title)
    }
    func viewLoader(setter: Bool){
        profileView.activityView.isHidden = setter
    }
    func switchToSignIn(){
        self.signInDelegate?.switchToSignIn()
//        let navigationController = UINavigationController(rootViewController: SignInVC.create())
//        AppDelegate.shared().window?.rootViewController = navigationController
        
    }
    func downloadImage(with urlString : String , imageCompletionHandler: @escaping (UIImage?) -> Void){
            guard let url = URL.init(string: urlString) else {
                return  imageCompletionHandler(nil)
            }
            let resource = ImageResource(downloadURL: url)
            
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    imageCompletionHandler(value.image)
                case .failure:
                    imageCompletionHandler(nil)
                }
            }
        }
    
    func setLabel(charaters: String){
        profileView.activityView.isHidden = true
        profileView.imageLabel.isHidden = false
        profileView.imageLabel.text = charaters
    }
    
    func setProfileView() -> ProfileView {
        return self.profileView
    }
        
}

