//
//  ItemCreateTransactionCell.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import TableKit

class ItemCreateTransactionCell: UITableViewCell, ConfigurableCell {
    
    func configure(with user: PWUser) {
        nameLabel.text = user.name
    }
    
    static var defaultHeight: CGFloat? {
        return 55
    }

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
