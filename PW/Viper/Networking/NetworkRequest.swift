//
//  NetworkRequest.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//


import Alamofire

class NetworkRequest: URLRequestConvertible {
    
    var parameters: [String: Any?]
    var networkRouter: NetworkRouter
    
    fileprivate var urlRequest: URLRequest!
    
    init(request: NetworkRouter, params: [String: Any?] = [:], withAuthHeader: Bool = true) {
        self.networkRouter = request
        self.parameters = params
        ()
        
        // init urlRequest
        guard let url = URL(string: PWConstants.Network.REQUESTS_BASE_URL) else {
            return
        }
        urlRequest = URLRequest(url: url.appendingPathComponent(self.networkRouter.path))
        urlRequest.timeoutInterval = 30 // set request timeout 30 sec
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if withAuthHeader { setAuthHeader() }
        setRequestParameters()
    }
    
    
    
    private func setRequestParameters() {
        do {
            if( urlRequest.httpMethod == HTTPMethod.get.rawValue) {
                try urlRequest.setParametersInUrl(params: self.parameters)
            } else {
                try urlRequest.setParrameters(params: self.parameters)

            }
        } catch let err {
            print(err)
        }
    }
    
    
    
    func asURLRequest() throws -> URLRequest {
        return urlRequest
    }
}

extension NetworkRequest {
    fileprivate func setAuthHeader() {
        if let token = PWUserDefaults.shared.tokenId {
            urlRequest.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        }
    }
    
}
