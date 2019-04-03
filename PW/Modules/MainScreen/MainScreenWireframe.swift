//
//  MainScreenWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class MainScreenWireframe: PWWireframe, MainScreenWireframeProtocol {
    
    static func createModule()-> UIViewController {
        
        let localDM = MainScreenLocalDM()
        let remoteDM = MainScreenRemoteDM()
        let wireframe = MainScreenWireframe()
        let interactor = MainScreenInteractor(localDM: localDM, remoteDM: remoteDM)
        let viewModel = MainScreenVM(wireframe: wireframe, interactor: interactor)
        
        return MainScreenVC(viewModel: viewModel)
        
    }
    
    func exit() {
        let vc = PWLoginWireframe.createModule()
        setNewRootVc(vc: vc)
    }
}
