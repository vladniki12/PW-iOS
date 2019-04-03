//
//  PWHistoryTransactionRemoteDMswift.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PWHistoryTransactionRemoteDM: PWRemoteDM, PWHistoryTransactionRemoteDMProtocol {

    func getHistory()-> Observable<PWHistoryTransaction> {
        
        let request = NetworkRequest(request: NetworkRouter.historyTransaction, params: [:], withAuthHeader: true)
        return getObject(request: request, disposeOnCompleted: [])
    }
}
