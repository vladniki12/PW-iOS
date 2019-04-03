//
//  PWCreateTransactionVM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PWCreateTransactionVM: PWViewModel, PWCreateTransactionVMProtocol {
    
    
    var arrayUsers: [PWUser]!
    var searchText = Variable<String?>("")
    var binder: Binder<[PWUser]>? = nil
    
    
    private let interactor: PWCreateTransactionInteractorProtocol
    private let wireframe: PWCreateTransactionWireframeProtocol
    
    
    
    init(interactor: PWCreateTransactionInteractorProtocol, wireframe: PWCreateTransactionWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.arrayUsers = []
    }
    func binding(binder: Binder<[PWUser]>, searchTextBinder: ControlProperty<String?>) {
        self.binder = binder
        searchTextBinder.asDriver()
            .drive(searchText)
            .disposed(by: disposeBag)
        searchText.asObservable().subscribe(onNext: { [weak self] (text) in
            self!.searchUser(name: text!)
        })
            .disposed(by: disposeBag)
    }
    
    func searchUser(name: String){
        interactor.searchUser(name: name).subscribe { (event) in
            if(event.element != nil) {
                self.binder!.onNext(event.element!)
            }
            if( name.isEmpty) {
                self.binder!.onNext([])
            }
        }.disposed(by: disposeBag)
    }
    

    
    func openSendTransactionScree(user: PWUser) {
        wireframe.openSendTransactionScree(user: user)
    }

}
