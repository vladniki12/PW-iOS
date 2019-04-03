//
//  PWTabBarItem.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

enum PWTabBarItem: Int {
    
    case mainScreen = 0
    case historyScreen = 1
    case createTransactionScreen = 2
    
    var title: String {
        switch self {
        case .mainScreen: return "main.title.main".localized
        case .createTransactionScreen: return "main.title.create".localized
        case .historyScreen: return "main.title.history".localized
        }
    }
    
    
    
    var item: UITabBarItem {
        
        return UITabBarItem(title: title, image: nil, tag: rawValue)
    }
}
