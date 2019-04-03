//
//  PWCreateTransactionVMProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PWCreateTransactionVMProtocol {
    var arrayUsers: [PWUser]! {get set}
    var searchText: Variable<String?> {get set}
    
    func searchUser(name: String)
    func binding(binder: Binder<[PWUser]>, searchTextBinder: ControlProperty<String?>)
    func openSendTransactionScree(user: PWUser)
}
