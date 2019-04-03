//
//  PWTransaction.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWTransaction: Codable {
    var id: Int!
    var date: String!
    var username: String!
    var amount: Float!
    var balance: Float!
    
    private enum CodingKeys: String, CodingKey {
        case id
        case date
        case username
        case amount
        case balance
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.date = try container.decode(String.self, forKey: .date)
        self.username = try container.decode(String.self, forKey: .username)
        self.amount = try container.decode(Float.self, forKey: .amount)
        self.balance = try container.decode(Float.self, forKey: .balance)
    }
}

