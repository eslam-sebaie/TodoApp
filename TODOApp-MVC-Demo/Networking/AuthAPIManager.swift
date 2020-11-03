//
//  APIManager.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    class func login(with email: String, password: String, completion: @escaping (_ error: Error?, _ loginData: LoginResponse?) -> Void) {
        
        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json"]
        let params: [String: Any] = [ParameterKeys.email: email,
                                     ParameterKeys.password: password]
        
        AF.request(URLs.login, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
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
                let loginData = try decoder.decode(LoginResponse.self, from: data)
                completion(nil, loginData)
            } catch let error {
                print(error)
            }
        }
    }
    
    class func SignUp(name: String ,email: String, password: String, age: Int, completion: @escaping () -> Void) {
        
        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json"]
        let params: [String: Any] = [ParameterKeys.name: name,ParameterKeys.email: email,
                                     ParameterKeys.password: password, ParameterKeys.age: age]
        
        AF.request(URLs.register, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
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
    
    class func postLogout(completion: @escaping () -> Void) {
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
}
