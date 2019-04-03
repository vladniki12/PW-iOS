//
//  PWSendTransactionInteractor.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class PWSendTransactionInteractor: PWSendTransactionInteractorProtocol {

    
    let remoteDM: PWSendTransactionRemoteDMProtocol
    let localDM: PWSendTransactionLocalDMProtocol
    
    init(localDM: PWSendTransactionLocalDMProtocol, remoteDM: PWSendTransactionRemoteDMProtocol) {
        self.remoteDM = remoteDM
        self.localDM = localDM
    }
    func sendAmount(name: String, amount: String)-> Observable<PWAddTransaction> {
        return remoteDM.sendAmount(name: name, amount: amount)
    }
   

}
