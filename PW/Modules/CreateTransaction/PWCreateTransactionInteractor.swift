//
//  PWCreateTransactionInteractor.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class PWCreateTransactionInteractor: PWCreateTransactionInteractorProtocol {

    
    let remoteDM: PWCreateTransactionRemoteDMProtocol
    let localDM: PWCreateTransactionLocalDMProtocol
    
    init(localDM: PWCreateTransactionLocalDMProtocol, remoteDM: PWCreateTransactionRemoteDMProtocol) {
        self.remoteDM = remoteDM
        self.localDM = localDM
    }
    
    func searchUser(name: String)-> Observable<[PWUser]> {
        return remoteDM.searchUser(name: name)
    }
   

}
