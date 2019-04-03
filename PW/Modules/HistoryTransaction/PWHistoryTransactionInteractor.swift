//
//  PWHistoryTransactionInteractor.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class PWHistoryTransactionInteractor: PWHistoryTransactionInteractorProtocol {

    
    let remoteDM: PWHistoryTransactionRemoteDMProtocol
    let localDM: PWHistoryTransactionLocalDMProtocol
    
    init(remoteDM: PWHistoryTransactionRemoteDMProtocol, localDM: PWHistoryTransactionLocalDMProtocol) {
        self.remoteDM = remoteDM
        self.localDM = localDM
    }
    
    func getHistory()-> Observable<PWHistoryTransaction> {
        return remoteDM.getHistory()
    }
   

}
