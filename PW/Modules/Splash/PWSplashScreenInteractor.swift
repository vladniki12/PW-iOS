//
//  PWSplashScreenInteractor.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWSplashScreenInteractor: PWSplashScreenInteractorPorotocol {
    
    private let localDM: PWSPlashScreenLocalDMProtocol
    private let remoteDM: PWSplashScreenRemoteDMProtocol
    
    init(localDM: PWSPlashScreenLocalDMProtocol, remoteDM: PWSplashScreenRemoteDMProtocol) {
        self.localDM = localDM
        self.remoteDM = remoteDM
    }
    
    func getToken()-> String? {
        return localDM.getToken()
    }

}
