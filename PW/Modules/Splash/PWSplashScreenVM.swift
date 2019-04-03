//
//  PWSplashScreenVM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWSplashScreenVM: PWViewModel, PWSplashScreenVMProtocol {

    private let interactor: PWSplashScreenInteractorPorotocol
    private let wireframe: PWSplashScreenWireframeProtocol
    
    init(interactor: PWSplashScreenInteractorPorotocol, wireframe: PWSplashScreenWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func openVc() {
        
        guard let token = PWUserDefaults.shared.tokenId else {
            wireframe.openLoginVC()
            return
        }
        
        if( !token.isEmpty) {
            wireframe.openMainVC()
        } else {
            wireframe.openLoginVC()
        }
    }
    

    
}
