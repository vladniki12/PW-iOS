//
//  PWSplaschScreenWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWSplaschScreenWireframe: PWWireframe, PWSplashScreenWireframeProtocol {

    static func createModule()-> UIViewController {
    
        let localDM = PWSplashScreenLocalDM()
        let remoteDM = PWSplashScreenRemoteDM()
        let wireframe = PWSplaschScreenWireframe()
        let interactor = PWSplashScreenInteractor(localDM: localDM, remoteDM: remoteDM)
        let viewModel = PWSplashScreenVM(interactor: interactor, wireframe: wireframe)
        
        return PWSplashScreenViewController(viewModel: viewModel)
        
    }
    
    func openLoginVC() {
        let vc = PWLoginWireframe.createModule()
        setNewRootVc(vc: vc)
    }
    
    func openMainVC() {
        
        setNewRootVc(vc: PWTabBarVC(), animated: true)
    }
}
