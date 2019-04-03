//
//  PWHistoryTransactionWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift

class PWHistoryTransactionWireframe: PWWireframe, PWHistoryTransactionWireframeProtocol {
    
    static func createModule()-> UIViewController {
        
        let localDM = PWHistoryTransactionLocalDM()
        let remoteDM = PWHistoryTransactionRemoteDM()
        let wireframe = PWHistoryTransactionWireframe()
        let interactor = PWHistoryTransactionInteractor(remoteDM: remoteDM, localDM: localDM)
        let viewModel = PWHistoryTransactionVM(interactor: interactor, wireframe: wireframe)
        
        return PWHistoryTransactionVC(viewModel: viewModel)
        
    }

}
