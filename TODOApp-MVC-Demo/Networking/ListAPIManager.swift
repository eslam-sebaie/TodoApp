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
    request1(APIRouter.addTask(description)) { (_, _) in
        completion()
      }
    }
    
    class func getTasks(completion: @escaping(Result<(Task), Error>) -> Void) {
        
        request(APIRouter.getTodos) { (response) in
            completion(response)
        }
    }
    
    class func deleteTask(id: String, completion: @escaping() -> Void) {
        
        request1(APIRouter.deleteTask(id)) { (_, _) in
            completion()
        }
     }
    
}
extension ListAPIManager{
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
