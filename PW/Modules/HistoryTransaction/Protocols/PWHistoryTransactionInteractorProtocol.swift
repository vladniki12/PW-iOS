//
//  PWHistoryTransactionInteractorProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PWHistoryTransactionInteractorProtocol {
    func getHistory()-> Observable<PWHistoryTransaction>
}
