//
//  PWSendTransactionWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import Foundation
import RxSwift

class PWSendTransactionWireframe: PWWireframe, PWSendTransactionWireframeProtocol {
    
    static func createModule(user: PWUser)-> UIViewController {
        
        let localDM = PWSendTransactionLocalDM()
        let remoteDM = PWSendTransactionRemoteDM()
        let wireframe = PWSendTransactionWireframe()
        let interactor = PWSendTransactionInteractor(localDM: localDM, remoteDM: remoteDM)
        let viewModel = PWSendTransactionVM(interactor: interactor, wireframe: wireframe, user: user)
        
        return PWSendTransactionVC(viewModel: viewModel)
        
    }
    
    func back() {
        pop()
    }
    
    func showAlertView(message: String, title: String) {
        showAlertViewWithOKButton(message: message, title: title, okAction: nil)
    }
    
    

}
