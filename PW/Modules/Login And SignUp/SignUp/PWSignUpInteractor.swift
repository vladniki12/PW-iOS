//
//  PWSplashScreenInteractor.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PWSignUpInteractor: PWSignUpInteractorPorotocol {
    
    private let localDM: PWSignUpLocalDMProtocol
    private let remoteDM: PWSignUpRemoteDMProtocol
    
    init(localDM: PWSignUpLocalDMProtocol, remoteDM: PWSignUpRemoteDMProtocol) {
        self.localDM = localDM
        self.remoteDM = remoteDM
    }
    
    func signUp(_ email: String, _ name: String, _ password: String, _ consfirmPassword: String ) -> Observable<PWTokenResponse> {
        return remoteDM.signUp(email, name, password, consfirmPassword)
    }

}
