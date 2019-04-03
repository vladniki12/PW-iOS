//
//  PWSplaschScreenWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWLoginWireframe: PWWireframe, PWLoginWireframeProtocol {

    static func createModule()-> UIViewController {
    
        let localDM = PWLoginLocalDM()
        let remoteDM = PWLoginRemoteDM()
        let wireframe = PWLoginWireframe()
        let interactor = PWLoginInteractor(localDM: localDM, remoteDM: remoteDM)
        let viewModel = PWLoginVM(interactor: interactor, wireframe: wireframe)
        
        return PWLoginVC(viewModel: viewModel)
        
    }
    
    func openSignUpVC() {
        let vc = PWSignUpWireframe.createModule()
        let nc = PWNavigationController(rootViewController: vc)
        topVC?.present(nc, animated: true)
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
