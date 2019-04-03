//
//  NetworkRouter.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import Alamofire


enum NetworkRouter {
    
    //login
    case login
    
    //SignUp
    case signUp
    
    //HistpryTransaction
    case historyTransaction 
    
    //CreateTransaction
    case createTransaction
    
    //GetUserInfo
    case userInfo
    
    //UsersList
    case usersList
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .signUp:
            return .post
        case .historyTransaction:
            return .get
        case .createTransaction:
            return .post
        case .userInfo:
            return .get
        case .usersList:
            return .post
        }
        
    }
    
    var path: String {
        switch self {
        case .login:
            return"sessions/create"
        case .signUp:
            return "users"
        case .historyTransaction:
            return "api/protected/transactions"
        case .createTransaction:
            return "api/protected/transactions"
        case .userInfo:
            return "api/protected/user-info"
        case .usersList:
            return "api/protected/users/list"
        }
    }
}

