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

class PWLoginRemoteDM: PWRemoteDM, PWLoginRemoteDMProtocol {
    
    func login(email: String, password: String) -> Observable<PWTokenResponse> {
        let parameters = [
            "email": email,
            "password": password
        ]
        let request = NetworkRequest(request: NetworkRouter.login, params: parameters, withAuthHeader: false)
        return getObject(request: request, disposeOnCompleted: [])
    }
}
