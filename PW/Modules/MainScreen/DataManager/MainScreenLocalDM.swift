//
//  MainScreenLocalDM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class MainScreenLocalDM: PWLocalDM, MainScreenLocalDMProtocol {
    func clearSession() {
        
            do {
                
                try realm!.write {
                    realm?.deleteAll()
                }
                
            } catch let err {
                print("\nRealm error: " + err.localizedDescription)
            }
        
    }
    
    func getProfile()-> PWUserInfoToken? {
        
            
        if let users = realm?.objects(PWUserInfoToken.self) {
            return users.first
        }
       
        
        return nil
    }
    
    func updateProfile(profile: PWUserInfoToken) {
        do {
            
            try realm!.write {
                if let users = realm?.objects(PWUserInfoToken.self) {
                    realm!.delete(users)
                    
                }
                realm!.add(profile, update: true)
            }
            
        } catch let err {
            print("\nRealm error: " + err.localizedDescription)
        }
    }
}
