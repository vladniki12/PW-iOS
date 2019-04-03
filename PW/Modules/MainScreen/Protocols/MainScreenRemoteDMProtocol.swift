//
//  MainScreenRemoteDMProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol MainScreenRemoteDMProtocol {
    func getUserInfo() -> Observable<PWUserInfo>
}
