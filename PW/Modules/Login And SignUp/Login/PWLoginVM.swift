//
//  PWSplashScreenVM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PWLoginVM: PWViewModel, PWLoginVMProtocol {

    private let interactor: PWLoginInteractorPorotocol
    private let wireframe: PWLoginWireframeProtocol
    
    init(interactor: PWLoginInteractorPorotocol, wireframe: PWLoginWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func openSignUpVC() {
        wireframe.openSignUpVC()
    }
    
    func login(email: String, password: String) {
        self.interactor.login(email: email, password: password).subscribe { (event) in
            if( event.element != nil) {
                PWUserDefaults.shared.tokenId = event.element?.idToken
                self.wireframe.openMainScreen()
            } else if(event.error != nil) {
                let error = event.error
                if( error != nil) {
                    self.wireframe.showAlertView(message: error!.localizedDescription, title: "")
                }
                
                
            }
        }.disposed(by: disposeBag)
    }
    
}
