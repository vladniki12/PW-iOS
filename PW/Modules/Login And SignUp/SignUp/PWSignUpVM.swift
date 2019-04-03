//
//  PWSplashScreenVM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PWSignUpVM: PWViewModel, PWSignUpVMProtocol {

    private let interactor: PWSignUpInteractorPorotocol
    private let wireframe: PWSignUpWireframeProtocol
    
    init(interactor: PWSignUpInteractorPorotocol, wireframe: PWSignUpWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func back() {
        wireframe.back()
    }
    
    func signUp(_ email: String, _ name: String, _ password: String, _ consfirmPassword: String ) {
        interactor.signUp(email, name, password, consfirmPassword).subscribe { (event) in
            if( event.element != nil) {
                //PWUserDefaults.shared.tokenId = event.element?.idToken
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
