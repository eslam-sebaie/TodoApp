//
//  Trash.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/13/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

//import Foundation

//    class func signUp(name: String ,email: String, password: String, age: Int, completion: @escaping () -> Void) {
//
//        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json"]
//        let params: [String: Any] = [ParameterKeys.name: name,ParameterKeys.email: email,
//                                     ParameterKeys.password: password, ParameterKeys.age: age]
//
//        AF.request(URLs.register, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
//            response in
//            guard response.error == nil else {
//                print(response.error!)
//                completion()
//                return
//            }
//
//            guard response.data != nil else {
//                print("didn't get any data from API")
//                return
//            }
//
//               completion()
//        }
//    }
//


//    class func logIn(with email: String, password: String, completion: @escaping (_ error: Error?, _ loginData: LoginResponse?) -> Void) {
//
//        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json"]
//        let params: [String: Any] = [ParameterKeys.email: email,
//                                     ParameterKeys.password: password]
//
//        AF.request(URLs.login, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
//            response in
//            guard response.error == nil else {
//                print(response.error!)
//                completion(response.error, nil)
//                return
//            }
//            guard let data = response.data else {
//                print("didn't get any data from API")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let loginData = try decoder.decode(LoginResponse.self, from: data)
//                completion(nil, loginData)
//            } catch let error {
//                completion(error, nil)
//                print(error)
//            }
//        }
//    }
//


//class func getProfile(completion: @escaping (_ error: Error?, _ loginData: UserData?) -> Void) {
//
//
//    let headers: HTTPHeaders = [HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
//
//    AF.request(URLs.profile, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: headers).response {
//        response in
//        guard response.error == nil else {
//            print(response.error!)
//            completion(response.error, nil)
//            return
//        }
//
//        guard let data = response.data else {
//            print("didn't get any data from API")
//            return
//        }
//        do {
//            let decoder = JSONDecoder()
//            let loginData = try decoder.decode(UserData.self, from: data)
//            completion(nil, loginData)
//        } catch let error {
//            print(error)
//        }
//    }
//}

//class func logout(completion: @escaping () -> Void) {
//    let headers: HTTPHeaders = [HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
//
//    AF.request(URLs.logout, method: HTTPMethod.post, parameters: nil, encoding: JSONEncoding.default, headers: headers).response {
//        response in
//        guard response.error == nil else {
//            print(response.error!)
//            completion()
//            return
//        }
//
//        guard response.data != nil else {
//            print("didn't get any data from API")
//            return
//        }
//        completion()
//
//    }
//}

//
//APIManager.getProfile { (err, profileData) in
//    self.profileOfData = profileData
//    self.userID = self.profileOfData.id
//    self.profileDictionary["Name"] = self.profileOfData.name
//    self.profileDictionary["Email"] = self.profileOfData.email
//    self.profileDictionary["Age"] = "\(self.profileOfData.age)"
//    self.profileTableView.reloadData()
//
//    let firstCharcters = self.getCharacters(name: self.profileOfData.name)
//    if UserDefaultsManager.shared().imgLabel == true {}
//    else {
//        self.imageLabel.isHidden = false
//        self.imageLabel.text = firstCharcters
//    }
//    self.showProfileImage()
//}


//class func editProfile(age: Int,completion: @escaping (_ error: Error?, _ success:Bool) -> Void) {
//
//        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
//        let params: [String: Any] = [ParameterKeys.age: age]
//        print(age)
//        AF.request(URLs.profile, method: HTTPMethod.put, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
//            response in
//            guard response.error == nil else {
//                print(response.error!)
//                completion(response.error, false)
//                return
//            }
//            guard let data = response.data else {
//                print("didn't get any data from API")
//                return
//            }
//            completion(nil, true)
//        }
//    }


//            APIManager.editProfile(age: Int(ageTF.text!)!) { (err, success) in
//                self.getProfileData()
//                self.activityView.isHidden = true
//            }


//class func getPhoto(id: String, completion: @escaping (_ error: Error?,_ avatar: UIImage) -> Void){
//    AF.request(URLs.base + "/\(id)/avatar", method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
//        response in
//
//        guard response.error == nil else {
//            print("errror")
//            completion(response.error, UIImage())
//            return
//        }
//        guard let data = response.data else {
//            print("didn't get any data from API")
//            return
//        }
//        let uiImage: UIImage = UIImage(data: data) ?? UIImage(named: "white")!
//        completion(nil, uiImage)
//    }
//}



//        APIManager.logIn(with: emailTextField.text!, password: passwordTextField.text!) { (error, loginData) in
//            if let error = error {
//                self.show_Alert("Wonge Email Or Password.")
//                self.activityView.isHidden = true
//                print(error.localizedDescription)
//            } else if let loginData = loginData {
//                UserDefaultsManager.shared().token = loginData.token
//            }
//
//
//            self.activityView.isHidden = true
//            self.present(TodoListVC.create(), animated: true, completion: nil)
//        }




//class func addTask(description: String, completion: @escaping() -> Void) {

////        let hedders: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
////        let params = [ParameterKeys.description: description]
////
////        AF.request(URLs.addTask, method: .post, parameters: params, encoding: JSONEncoding.default, headers: hedders).response {
////            response in
////
////            guard response.error == nil else {
////                print(response.error!)
////                completion()
////                return
////            }
////            guard response.data != nil else {
////                print("didn't get any data from API")
////                return
////            }
////               completion()
////        }
// }


//class func getTasks(completion: @escaping(Result<(Task), Error>) -> Void) {

//
//        let hedders: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
//        AF.request(URLs.base + URLs.addTask, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: hedders).response {
//            response in
//            guard response.error == nil else {
//                print(response.error!)
//
//                return
//            }
//
//            guard let data = response.data else {
//                print("didn't get any data from API")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let taskData = try decoder.decode(Task.self, from: data).data
//                completion(nil, taskData)
//            } catch let error {
//                print(error)
//            }
//        }
//}


//class func deleteTask(id: String, completion: @escaping() -> Void) {
   
    
    
//     let hedders: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
//
//        AF.request(URLs.addTask + "/\(id)", method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: hedders).response {
//             response in
//
//             guard response.error == nil else {
//                 print(response.error!)
//                 completion()
//                 return
//             }
//             guard response.data != nil else {
//                 print("didn't get any data from API")
//                 return
//             }
//                completion()
//         }
// }
