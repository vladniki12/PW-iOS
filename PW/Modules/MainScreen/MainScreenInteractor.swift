//
//  MainScreenInteractor.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainScreenInteractor: MainScreenInteractorProtocol {

    let localDM: MainScreenLocalDMProtocol
    let remoteDM: MainScreenRemoteDMProtocol
    
    init(localDM: MainScreenLocalDMProtocol, remoteDM: MainScreenRemoteDMProtocol) {
        self.localDM = localDM
        self.remoteDM = remoteDM
    }
    
    func getUserInfo() -> Observable<PWUserInfo> {
        return remoteDM.getUserInfo()
    }
    
    func getUserInfoDB()-> PWUserInfoToken? {
        return localDM.getProfile()
    }
    
    func updateUserInfo(user: PWUserInfoToken) {
        localDM.updateProfile(profile: user)
    }
    
    func clearSession() {
        PWUserDefaults.shared.tokenId = ""
        localDM.clearSession()
    }
}
