//
//  PWSendTransactionRemoteDMswift.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PWSendTransactionRemoteDM: PWRemoteDM, PWSendTransactionRemoteDMProtocol {
    func sendAmount(name: String, amount: String)-> Observable<PWAddTransaction> {
        let request = NetworkRequest(request: NetworkRouter.createTransaction, params: ["name": name,
                                                                                "amount": amount], withAuthHeader: true)
        return getObject(request: request, disposeOnCompleted: [])
    }
}
