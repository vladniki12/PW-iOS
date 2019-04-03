//
//  MainScreenInteractorProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol MainScreenInteractorProtocol {
    func getUserInfo() -> Observable<PWUserInfo>
    func clearSession()
    func getUserInfoDB()-> PWUserInfoToken?
    func updateUserInfo(user: PWUserInfoToken)
}
