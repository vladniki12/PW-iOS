//
//  PWSplashScreenInteractorPorotocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import RxCocoa
import RxSwift

protocol PWLoginInteractorPorotocol {
    func login(email: String, password: String) -> Observable<PWTokenResponse>
}
