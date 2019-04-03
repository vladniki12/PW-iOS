//
//  PWSplashScreenRemoteDM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PWSignUpRemoteDM: PWRemoteDM, PWSignUpRemoteDMProtocol {
    func signUp(_ email: String, _ name: String, _ password: String, _ consfirmPassword: String ) -> Observable<PWTokenResponse> {
        let parameters = [
            "email": email,
            "username": name,
            "password": password
        ]
        let request = NetworkRequest(request: NetworkRouter.signUp, params: parameters, withAuthHeader: false)
        return getObject(request: request, disposeOnCompleted: [])
    }
}
