//
//  PWHistoryTransactionVMProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PWHistoryTransactionVMProtocol {
    func getHistory(binderItems: Binder<[PWTransaction]>)
}
