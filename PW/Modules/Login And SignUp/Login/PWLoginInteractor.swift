//
//  PWSplashScreenInteractor.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import RxCocoa
import RxSwift

class PWLoginInteractor: PWLoginInteractorPorotocol {
    
    private let localDM: PWLoginLocalDMProtocol
    private let remoteDM: PWLoginRemoteDMProtocol
    
    init(localDM: PWLoginLocalDMProtocol, remoteDM: PWLoginRemoteDMProtocol) {
        self.localDM = localDM
        self.remoteDM = remoteDM
    }
    
    func login(email: String, password: String) -> Observable<PWTokenResponse> {
        return self.remoteDM.login(email: email, password: password)
    }

}
