//
//  PWCreateTransactionRemoteDMswift.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PWCreateTransactionRemoteDM: PWRemoteDM, PWCreateTransactionRemoteDMProtocol {

    func searchUser(name: String)-> Observable<[PWUser]> {
        let request = NetworkRequest(request: NetworkRouter.usersList, params: ["filter": name], withAuthHeader: true)
        return getArray(request: request, disposeOnCompleted: [])
    }
}
