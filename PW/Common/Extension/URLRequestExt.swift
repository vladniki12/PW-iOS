//
//  URLRequestExt.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Alamofire

extension URLRequest {
    
    // MARK: - Request parameters
    // MARK:
    
    mutating func setParrameters(params: [String: Any]?) throws {
        if self.httpMethod == HTTPMethod.get.rawValue {
            self = try URLEncoding.default.encode(self, with: params)
        } else {
            self.httpBody = try JSONSerialization.data(withJSONObject: params ?? [], options: .prettyPrinted)
        }
    }
    
    mutating func setParametersInUrl(params: [String:Any?]?) throws {
        guard let url = self.url else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        let parameters = params ?? [:]
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + query(parameters)
            urlComponents.percentEncodedQuery = percentEncodedQuery
            self.url = urlComponents.url
        }
    }
    
    private func query(_ parameters: [String: Any?]) -> String {
        var components: [(String, String)] = []
        for key in parameters.keys.sorted(by: <) {
            if let value = parameters[key], value != nil {
                let component = URLEncoding.default.queryComponents(fromKey: key, value: value!)
                // whis map has not to be here, but it is because of pdf-reports API endpoints handling on backend
                components += component.map { ($0.0.replacingOccurrences(of: "%5B%5D", with: ""), $0.1) }
            }
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}
