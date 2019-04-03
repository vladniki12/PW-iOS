//
//  PWNavigationController.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import Foundation

class PWNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set nav bar tint and title color
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white, NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont.init(name: "Rubik-Regular", size: 17.0) as Any]
        
        navigationBar.topItem?.title = navigationBar.topItem?.title?.uppercased()
        
        
    }
}
