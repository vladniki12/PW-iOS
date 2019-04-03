//
//  PWSendTransactionWireframeProtocol.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift

protocol PWSendTransactionWireframeProtocol {
    func back()
    func showAlertView(message: String, title: String)
}
