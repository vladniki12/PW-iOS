//
//  PWSplaschScreenWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWSignUpWireframe: PWWireframe, PWSignUpWireframeProtocol {

    static func createModule()-> UIViewController {
    
        let localDM = PWSignUpLocalDM()
        let remoteDM = PWSignUpRemoteDM()
        let wireframe = PWSignUpWireframe()
        let interactor = PWSignUpInteractor(localDM: localDM, remoteDM: remoteDM)
        let viewModel = PWSignUpVM(interactor: interactor, wireframe: wireframe)
        
        return PWSignUpVC(viewModel: viewModel)
        
    }
    
    func back() {
        topVC?.navigationController?.dismiss(animated: true)
    }
    
    func showAlertView(message: String, title: String) {
        showAlertViewWithOKButton(message: message, title: title, okAction: nil)
    }
    
    func openMainScreen() {
        showStatusBar()
        setNewRootVc(vc: PWTabBarVC(), animated: true)
    }
    
    private func showStatusBar() {
        UIApplication.shared.isStatusBarHidden = false
    }
}
