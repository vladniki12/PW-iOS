//
//  PWUserDefaults.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWUserDefaults: PWLocalDM {
    
    static let shared = PWUserDefaults()
    
    private let defaults = UserDefaults.standard
    
    var tokenId: String? {
        get {
            return defaults.string(forKey: PWConstants.UserDefKeys.TOKEN_ID_KEY)
        }
        set {
            defaults.set(newValue, forKey: PWConstants.UserDefKeys.TOKEN_ID_KEY)
        }
    }
    
   /* var tokenMap: String? {
        get {
            
        }
    }*/
 

}
