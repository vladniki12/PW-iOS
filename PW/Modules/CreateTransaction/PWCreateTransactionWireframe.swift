//
//  PWCreateTransactionWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift

class PWCreateTransactionWireframe: PWWireframe, PWCreateTransactionWireframeProtocol {
    
    static func createModule()-> UIViewController {
        
        let localDM = PWCreateTransactionLocalDM()
        let remoteDM = PWCreateTransactionRemoteDM()
        let wireframe = PWCreateTransactionWireframe()
        let interactor = PWCreateTransactionInteractor(localDM: localDM, remoteDM: remoteDM)
        let viewModel = PWCreateTransactionVM(interactor: interactor, wireframe: wireframe)
        
        return PWCreateTransaction(viewModel: viewModel)
        
    }
    
    func openSendTransactionScree(user: PWUser) {
        let vc = PWSendTransactionWireframe.createModule(user: user)
        push(vc: vc)
    }

}
