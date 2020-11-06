//
//  ListAPIManager.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import Alamofire

class ListAPIManager {
    
   class func addTask(description: String, completion: @escaping() -> Void) {
        let hedders: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
        let params = [ParameterKeys.description: description]
        
        AF.request(URLs.addTask, method: .post, parameters: params, encoding: JSONEncoding.default, headers: hedders).response {
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
    
    class func getTasks(completion: @escaping(_ error: Error?, [AllTasks]) -> Void) {
        let hedders: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]
        AF.request(URLs.addTask, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: hedders).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                
                return
            }
            
            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let taskData = try decoder.decode(Task.self, from: data).data
                completion(nil, taskData)
            } catch let error {
                print(error)
            }
        }
    }
    
    class func deleteTask(id: String, completion: @escaping() -> Void) {
     let hedders: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.Authorization: "Bearer \(UserDefaultsManager.shared().token ?? "")"]

        AF.request(URLs.addTask + "/\(id)", method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: hedders).response {
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
