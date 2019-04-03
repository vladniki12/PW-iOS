//
//  PWSplashScreenVMProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

protocol PWLoginVMProtocol {
    func openSignUpVC()
    func login(email: String, password: String)
}
