//
//  PWHistoryTransactionVM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PWHistoryTransactionVM: PWViewModel, PWHistoryTransactionVMProtocol {
    
    private let interactor: PWHistoryTransactionInteractorProtocol
    private let wireframe: PWHistoryTransactionWireframeProtocol
    
    init(interactor: PWHistoryTransactionInteractorProtocol, wireframe: PWHistoryTransactionWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func getHistory(binderItems: Binder<[PWTransaction]>) {
        interactor.getHistory().subscribe { (event) in
            if( event.element != nil) {
                binderItems.onNext(event.element!.transToken)
            }
        }.disposed(by: disposeBag)
    }
    
    

}
