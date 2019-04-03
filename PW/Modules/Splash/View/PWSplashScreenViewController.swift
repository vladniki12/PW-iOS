//
//  PWSplashScreenViewController.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWSplashScreenViewController: PWViewController, PWSplashScreenVCProtocol {

    
    var viewModel: PWSplashScreenVMProtocol
    
    init(viewModel: PWSplashScreenVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: PWSplashScreenViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
    }
    
    
    func prepareView() {
        viewModel.openVc()
    }


   

}
