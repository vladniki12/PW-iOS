//
//  PWTokenResponse.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWTokenResponse: Codable  {
    
    
    var idToken: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case idToken = "id_token"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idToken = try container.decode(String.self, forKey: .idToken)
    }
}
