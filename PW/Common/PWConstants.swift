//
//  PWConstants.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//



struct PWConstants {
    struct UserDefKeys {
        static let TOKEN_ID_KEY = "shared_token_id_key"
    }
    
    
    struct Network {
        static let API_SCHEME = "http://"
        static let API_DOMAIN = "193.124.114.46"
        static let BASE_PORT = ":3001/"
        static let REQUESTS_BASE_URL = API_SCHEME + API_DOMAIN + BASE_PORT
    }
}
