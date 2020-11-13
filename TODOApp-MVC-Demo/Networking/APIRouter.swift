//
//  APIRouter.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 11/10/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    
    // The endpoint name
    case login(_ email: String, _ password: String)
    case signUp(_ name: String , _ email: String, _ password: String, _ age: Int)
    case getTodos
    case logout
    case getProfile
    case editProfile(_ age: Int)
    case uploadPhoto(_ data:Data)
//
    case addTask(_ description:String)
    case deleteTask(_ id: String)
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self{
        case .getTodos, .getProfile:
            return .get
        case .editProfile:
            return .put
        case .deleteTask:
            return .delete
        default:
            return .post
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [ParameterKeys.email: email, ParameterKeys.password: password]
        case .signUp(let name, let email, let password, let age):
          return [ParameterKeys.name: name,ParameterKeys.email: email,
                                         ParameterKeys.password: password, ParameterKeys.age: age]
        case .editProfile(let age):
            return [ParameterKeys.age: age]
     
            
        case .addTask(let description):
            return [ParameterKeys.description: description]
            
        case .deleteTask(let id):
            return ["id": id]
        default:
            return nil
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return URLs.login
        case .signUp:
            return URLs.register
        case .getTodos:
            return URLs.addTask
        case .logout:
            return URLs.logout
        
        case .getProfile, .editProfile:
            return URLs.profile
        
        case .uploadPhoto:
            return URLs.postPhoto
            
        case .addTask:
            return URLs.addTask
            
        case .deleteTask(let id):
            return URLs.addTask + "/\(id)"
        }
    }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
       
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        switch self {
        case  .logout, .getProfile, .uploadPhoto:
            urlRequest.setValue("Bearer \(UserDefaultsManager.shared().token ?? "")",
            forHTTPHeaderField: HeaderKeys.Authorization)
        case .signUp, .editProfile, .addTask, .getTodos, .deleteTask:
            urlRequest.setValue("Bearer \(UserDefaultsManager.shared().token ?? "")",
            forHTTPHeaderField: HeaderKeys.Authorization)
            urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.contentType)
        
        default:
            
            break
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.contentType)
        
        
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
    var httpBody: MultipartFormData {
            let multipartFormData = MultipartFormData()
            switch self {
            case .uploadPhoto(let data):
                multipartFormData.append(data, withName: "avatar", fileName: "avatar.png", mimeType: "image/png")
            default: ()
            }

            return multipartFormData
        }
    
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}

// type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}
