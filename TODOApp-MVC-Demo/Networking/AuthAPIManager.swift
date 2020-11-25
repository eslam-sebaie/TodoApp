//
//  APIManager.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Alamofire
import UIKit
import SwiftyJSON
class APIManager {
    
    class func  logIn(with email: String, password: String, completion: @escaping (Result<LoginResponse, Error>)-> ()){
        request(APIRouter.login(email, password)){ (response) in
            completion(response)
        }
    }
    
    class func signUp(name: String ,email: String, password: String, age: Int, completion: @escaping (_ error:Error?, _ Success: Bool)-> ()){
        
//        request1(APIRouter.signUp(name, email, password, age)) { (err, success) in
//            if let err = err {
//                completion(err, false)
//            }
//            else {
//                completion(nil, true)
//            }
//        }
        let userData = UserData1(name: name, email: email, password: password, age: age)
        request1(APIRouter.signUp(userData)) { (err, success) in
            if let err = err {
                print("err")
                completion(err, false)
            }
            else {
                print("ookok")
                completion(nil, true)
            }
        }
    }

    
    class func logout(completion: @escaping () -> ()){
        request1(APIRouter.logout) { (err, _ ) in
            completion()
        }
     }
    
    class func getProfile(completion: @escaping (Result<(UserData), Error>) -> Void) {
        request(APIRouter.getProfile) { (response) in
            completion(response)
        }
    }
    
    
    class func uploadPhoto(avatar: UIImage, completion: @escaping () -> Void){
        let data = avatar.jpegData(compressionQuality: 0.75)
        let route = APIRouter.uploadPhoto(data!)
        
        AF.upload(multipartFormData: route.httpBody, with: route)
        .uploadProgress(closure: { (progress) in
           print("\(progress)")
        }).validate().responseData { (response) in
            print(response)
            completion()
        }
    }
        
       
    class func editProfile(age: Int,completion: @escaping () -> Void) {
        request1(APIRouter.editProfile(age)) { (_ , _ ) in
            completion()
        }
        
    }
    
}
extension APIManager{
    // MARK:- The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        .responseJSON { response in
           print(response)
        }
    }
    
    
    private static func request1(_ urlConvertible: URLRequestConvertible, completion:  @escaping (_ error: Error?,_ data: Any) -> ()) {
        
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).response { (response: AFDataResponse) in
            print("ok1")
        }
        .responseJSON { response in
            print(response)
            completion(nil, response)
        }
    }
}

