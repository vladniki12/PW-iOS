//
//  PWHistoryTransaction.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWHistoryTransaction: Codable {
    var transToken: [PWTransaction]!
    
    private enum CodingKeys: String, CodingKey {
        case transToken = "trans_token"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transToken = try container.decode([PWTransaction].self, forKey: .transToken)
    }

}
