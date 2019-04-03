//
//  MainScreenRemoteDM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainScreenRemoteDM: PWRemoteDM, MainScreenRemoteDMProtocol {

    func getUserInfo() -> Observable<PWUserInfo> {
        let request = NetworkRequest(request: NetworkRouter.userInfo, params: [:], withAuthHeader: true)
        return getObject(request: request, disposeOnCompleted: [])
    }
}
