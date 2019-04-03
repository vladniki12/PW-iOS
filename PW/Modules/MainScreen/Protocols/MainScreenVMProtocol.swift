//
//  MainScreenVMProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol MainScreenVMProtocol {
    func getUserInfo(email: Binder<String?>,
                     userName: Binder<String?>,
                     balance: Binder<String?>,
                     id: Binder<String?>
                     )
    func exit()
}
