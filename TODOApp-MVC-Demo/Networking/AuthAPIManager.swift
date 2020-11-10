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
    
   class func signUp(name: String ,email: String, password: String, age: Int, completion: @escaping (Result<(Bool), Error>)-> ()){
        request(APIRouter.signUp(name, email, password, age)){ (response) in
            completion(response)
        }
    }
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
    
    class func logout(completion: @escaping (Result<(Bool), Error>)-> ()){
        request(APIRouter.logout){ (response) in
             completion(response)
         }
     }
    
    class func getProfile(completion: @escaping (_ error: Error?, _ loginData: UserData?) -> Void) {
        
        let headers: HTTPHeaders = [HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
        
        AF.request(URLs.profile, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: headers).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }
            do {
                let decoder = JSONDecoder()
                let loginData = try decoder.decode(UserData.self, from: data)
                completion(nil, loginData)
            } catch let error {
                print(error)
            }
        }
    }
    
    class func logout(completion: @escaping () -> Void) {
        let headers: HTTPHeaders = [HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
        
        AF.request(URLs.logout, method: HTTPMethod.post, parameters: nil, encoding: JSONEncoding.default, headers: headers).response {
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
        AF.request(URLs.base + "/\(id)/avatar", method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response {
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
    
    class func editProfile(age: Int,completion: @escaping (_ error: Error?, _ success:Bool) -> Void) {
        
        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
        let params: [String: Any] = [ParameterKeys.age: age]
        print(age)
        AF.request(URLs.profile, method: HTTPMethod.put, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                completion(response.error, false)
                return
            }
            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }
            completion(nil, true)
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
}
