//
//  MainScreenLocalDMProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

protocol MainScreenLocalDMProtocol {
    func clearSession()
    func getProfile()-> PWUserInfoToken?
    func updateProfile(profile: PWUserInfoToken)
}
