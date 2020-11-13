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
        
        request1(APIRouter.signUp(name, email, password, age)) { (err, success) in
            if let err = err {
                completion(err, false)
            }
            else {
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
            let headers: HTTPHeaders = [HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
            AF.upload(multipartFormData: { (form: MultipartFormData) in
                
                if let data = avatar.jpegData(compressionQuality: 0.75) {
                    form.append(data, withName: "avatar", fileName: "avatar.jpeg", mimeType: "image/jpeg")
                }
            }, to: URLs.postImage, usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: headers).response {
                response in
                guard response.error == nil else {
                    print(response.error!)
                    completion()
                    return
                }
                guard response.data != nil else {
                    print("didn't get any data from API")
                    return
                }
                completion()
            }
        }
        
        class func getPhoto(id: String, completion: @escaping (_ error: Error?,_ avatar: UIImage) -> Void){
          
            
            AF.request(URLs.base + "user/\(id)/avatar", method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
                response in

                guard response.error == nil else {
                    print("errror")
                    completion(response.error, UIImage())
                    return
                }
                guard let data = response.data else {
                    print("didn't get any data from API")
                    return
                }
                let uiImage: UIImage = UIImage(data: data) ?? UIImage(named: "white")!
                completion(nil, uiImage)
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

