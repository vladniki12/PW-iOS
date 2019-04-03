//
//  PWSendTransactionVM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift

class PWSendTransactionVM: PWViewModel, PWSendTransactionVMProtocol {
    var user: PWUser
    
    
    private let interactor: PWSendTransactionInteractorProtocol
    private let wireframe: PWSendTransactionWireframeProtocol
    
    init(interactor: PWSendTransactionInteractorProtocol, wireframe: PWSendTransactionWireframeProtocol, user: PWUser) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.user = user
    }
    
    func sendMoney(amount: String) {
        interactor.sendAmount(name: user.name, amount: amount).subscribe { (event) in
            if( event.element != nil) {
                self.wireframe.showAlertView(message: "transaction.message.success".localized, title: "")
                self.wireframe.back()
            } else if(event.error != nil) {
                let error = event.error
                if( error != nil) {
                    
                    self.wireframe.showAlertView(message: error!.localizedDescription, title: "")
                }
            }
                
        }.addDisposableTo(disposeBag)
    }
    
    func back() {
        wireframe.back()
    }
    
    

}
