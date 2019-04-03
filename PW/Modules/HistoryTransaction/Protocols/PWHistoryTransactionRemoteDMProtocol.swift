//
//  PWHistoryTransactionRemoteDMProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift

protocol PWHistoryTransactionRemoteDMProtocol {
    func getHistory()-> Observable<PWHistoryTransaction>
}
