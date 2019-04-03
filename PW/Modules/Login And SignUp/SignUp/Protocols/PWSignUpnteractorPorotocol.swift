//
//  PWSplashScreenInteractorPorotocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol PWSignUpInteractorPorotocol {
    func signUp(_ email: String, _ name: String, _ password: String, _ consfirmPassword: String ) -> Observable<PWTokenResponse>
}
