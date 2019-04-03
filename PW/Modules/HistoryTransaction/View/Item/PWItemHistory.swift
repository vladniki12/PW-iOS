//
//  PWItemHistory.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import TableKit

class PWItemHistory: UITableViewCell, ConfigurableCell {
    
    func configure(with transaction: PWTransaction) {
        nameLabel.text = transaction.username
        balanceLabel.text = String(transaction.balance)
        amountLabel.text = String(transaction.amount)
        dateLabel.text = transaction.date
    }
   
    static var defaultHeight: CGFloat? {
        return 55
    }
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
   
    
    
}
