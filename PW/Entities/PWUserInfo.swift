//
//  PWUserInfo.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RealmSwift

class PWUserInfo: Decodable {
    var userInfoToken: PWUserInfoToken!
    
    private enum CodingKeys: String, CodingKey {
        case userInfoToken = "user_info_token"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userInfoToken = try container.decode(PWUserInfoToken.self, forKey: .userInfoToken)
    }
}

class PWUserInfoToken: Object, Decodable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String!
    @objc dynamic var email: String!
    @objc dynamic var balance: Float = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case balance
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.balance = try container.decode(Float.self, forKey: .balance)
    }
}
